package com.pizzaeight.player_corpses;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.commands.arguments.EntityArgument;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.ListTag;
import net.minecraft.nbt.Tag;
import net.minecraft.nbt.NbtOps;
import net.minecraft.world.item.ItemStack;
import net.minecraft.core.HolderLookup;
import eu.pb4.trinkets.api.TrinketsApi;
import eu.pb4.trinkets.api.TrinketAttachment;
import eu.pb4.trinkets.api.TrinketSlotAccess;
import com.mojang.serialization.DynamicOps;
import net.minecraft.util.ProblemReporter;
import net.minecraft.world.level.storage.TagValueOutput;
import net.minecraft.world.level.storage.TagValueInput;
import net.minecraft.world.level.storage.ValueInput;
import java.util.Optional;

import static net.minecraft.commands.Commands.argument;
import static net.minecraft.commands.Commands.literal;

public class PlayerCorpsesMod implements ModInitializer {

    @Override
    public void onInitialize() {
        CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> {
            dispatcher.register(literal("corpse_api")
                    .then(literal("save_modded_inv")
                            .then(argument("player", EntityArgument.player())
                                    .then(argument("corpse", EntityArgument.entity())
                                            .executes(context -> {
                                                ServerPlayer player = EntityArgument.getPlayer(context, "player");
                                                Entity corpse = EntityArgument.getEntity(context, "corpse");
                                                saveTrinkets(player, corpse, registryAccess);
                                                return 1;
                                            }))))
                    .then(literal("restore_modded_inv")
                            .then(argument("player", EntityArgument.player())
                                    .then(argument("corpse", EntityArgument.entity())
                                            .executes(context -> {
                                                ServerPlayer player = EntityArgument.getPlayer(context, "player");
                                                Entity corpse = EntityArgument.getEntity(context, "corpse");
                                                restoreTrinkets(player, corpse, registryAccess);
                                                return 1;
                                            })))));
        });

        PlayerCorpsesTickHandler.register();
    }

    private void saveTrinkets(ServerPlayer player, Entity corpse,
            net.minecraft.commands.CommandBuildContext registryAccess) {
        DynamicOps<Tag> ops = registryAccess.createSerializationContext(NbtOps.INSTANCE);

        // Snapshot standard inventory
        java.util.List<CompoundTag> savedInventory = new java.util.ArrayList<>();
        for (int i = 0; i < player.getInventory().getContainerSize(); i++) {
            ItemStack stack = player.getInventory().getItem(i);
            if (!stack.isEmpty()) {
                CompoundTag entry = new CompoundTag();
                entry.putByte("Slot", (byte) i);
                Optional<Tag> itemTagOpt = ItemStack.CODEC.encodeStart(ops, stack).result();
                if (itemTagOpt.isPresent()) {
                    entry.put("Item", itemTagOpt.get());
                    savedInventory.add(entry);
                }
            }
        }

        // Snapshot Trinkets
        TrinketAttachment attachment = TrinketsApi.getAttachment(player);
        java.util.List<CompoundTag> savedTrinkets = new java.util.ArrayList<>();
        if (attachment != null) {
            attachment.forEach((ref, stack) -> {
                if (!stack.isEmpty()) {
                    CompoundTag entry = new CompoundTag();
                    entry.putString("SlotId", ref.slotType().getId());
                    entry.putInt("Index", ref.index());

                    Optional<Tag> itemTagOpt = ItemStack.CODEC.encodeStart(ops, stack).result();
                    if (itemTagOpt.isPresent()) {
                        entry.put("Item", itemTagOpt.get());
                        savedTrinkets.add(entry);
                    }
                }
            });
        }

        PlayerCorpsesDataState.get(player.level().getServer().overworld()).setCorpseData(corpse.getUUID(), savedInventory, savedTrinkets);
    }

    private void restoreTrinkets(ServerPlayer player, Entity corpse,
            net.minecraft.commands.CommandBuildContext registryAccess) {
        PlayerCorpsesDataState dataState = PlayerCorpsesDataState.get(player.level().getServer().overworld());
        PlayerCorpsesDataState.CorpseData corpseData = dataState.getCorpseData(corpse.getUUID());

        if (corpseData == null)
            return;

        DynamicOps<Tag> ops = registryAccess.createSerializationContext(NbtOps.INSTANCE);

        // Restore standard inventory (Armor & Offhand first, then Main)
        java.util.List<CompoundTag> sortedStandardInv = new java.util.ArrayList<>(corpseData.standardInv);
        sortedStandardInv.sort((a, b) -> {
            int slotA = a.getByte("Slot").orElse((byte) 0) & 255;
            int slotB = b.getByte("Slot").orElse((byte) 0) & 255;
            if (slotA >= 36 && slotB < 36) return -1;
            if (slotA < 36 && slotB >= 36) return 1;
            return Integer.compare(slotB, slotA);
        });

        for (CompoundTag entry : sortedStandardInv) {
            int slot = entry.getByte("Slot").orElse((byte) 0) & 255;
            Tag itemTag = entry.get("Item");
            if (itemTag != null) {
                Optional<ItemStack> stackOpt = ItemStack.CODEC.parse(ops, itemTag).result();
                if (stackOpt.isPresent() && !stackOpt.get().isEmpty()) {
                    ItemStack stack = stackOpt.get();
                    ItemStack currentInSlot = player.getInventory().getItem(slot);
                    if (currentInSlot.isEmpty()) {
                        player.getInventory().setItem(slot, stack);
                    } else {
                        ItemStack remainder = insertItemSmart(player, stack);
                        if (!remainder.isEmpty()) {
                            PlayerCorpsesOverflowState.get(player.level().getServer().overworld()).addOverflow(player.getUUID(), remainder);
                        }
                    }
                }
            }
        }

        // Restore Trinkets
        TrinketAttachment attachment = TrinketsApi.getAttachment(player);
        if (attachment != null) {
            for (CompoundTag entry : corpseData.trinkets) {
                String slotId = entry.getString("SlotId").orElse("");
                int index = entry.getInt("Index").orElse(0);

                Tag itemTag = entry.get("Item");
                if (itemTag != null) {
                    Optional<ItemStack> stackOpt = ItemStack.CODEC.parse(ops, itemTag).result();
                    if (stackOpt.isPresent() && !stackOpt.get().isEmpty()) {
                        ItemStack stack = stackOpt.get();
                        TrinketSlotAccess access = attachment.getSlotAccess(slotId, index);
                        if (access != null && access.get().isEmpty()) {
                            access.set(stack);
                        } else {
                            ItemStack remainder = insertItemSmart(player, stack);
                            if (!remainder.isEmpty()) {
                                PlayerCorpsesOverflowState.get(player.level().getServer().overworld()).addOverflow(player.getUUID(), remainder);
                            }
                        }
                    }
                }
            }
        }

        dataState.removeCorpseData(corpse.getUUID());
    }

    public static ItemStack insertItemSmart(ServerPlayer player, ItemStack stack) {
        if (stack.isEmpty())
            return ItemStack.EMPTY;
        ItemStack remainder = stack.copy();

        // 1. Try to merge with existing stacks
        for (int i = 0; i < 36; i++) {
            if (remainder.isEmpty()) break;
            ItemStack slotStack = player.getInventory().getItem(i);
            if (!slotStack.isEmpty() && ItemStack.isSameItemSameComponents(slotStack, remainder)) {
                int space = slotStack.getMaxStackSize() - slotStack.getCount();
                if (space > 0) {
                    int toAdd = Math.min(space, remainder.getCount());
                    slotStack.grow(toAdd);
                    remainder.shrink(toAdd);
                }
            }
        }

        // 2. Try to place in empty slots
        for (int i = 0; i < 36; i++) {
            if (remainder.isEmpty()) break;
            ItemStack slotStack = player.getInventory().getItem(i);
            if (slotStack.isEmpty()) {
                player.getInventory().setItem(i, remainder.copy());
                remainder.setCount(0);
            }
        }

        if (remainder.isEmpty())
            return ItemStack.EMPTY;

        remainder = insertIntoBackpacks(player, remainder);
        return remainder;
    }

    private static ItemStack insertIntoBackpacks(ServerPlayer player, ItemStack incoming) {
        if (incoming.isEmpty())
            return incoming;

        if (isBackpack(incoming))
            return incoming;

        java.util.List<ItemStack> backpacks = new java.util.ArrayList<>();
        for (int i = 0; i < player.getInventory().getContainerSize(); i++) {
            ItemStack stack = player.getInventory().getItem(i);
            if (isBackpack(stack))
                backpacks.add(stack);
        }

        TrinketAttachment attachment = TrinketsApi.getAttachment(player);
        if (attachment != null) {
            attachment.forEach((ref, stack) -> {
                if (isBackpack(stack))
                    backpacks.add(stack);
            });
        }

        for (ItemStack backpack : backpacks) {
            incoming = insertIntoBackpack(backpack, incoming, player.level().registryAccess());
            if (incoming.isEmpty())
                break;
        }

        return incoming;
    }

    private static boolean isBackpack(ItemStack stack) {
        if (stack.isEmpty())
            return false;
        String id = net.minecraft.core.registries.BuiltInRegistries.ITEM.getKey(stack.getItem()).toString();
        return id.contains("tiered_backpacks") || id.contains("_backpack");
    }

    private static ItemStack insertIntoBackpack(ItemStack backpack, ItemStack incoming,
            net.minecraft.core.HolderLookup.Provider provider) {
        int capacity = 27;
        String id = net.minecraft.core.registries.BuiltInRegistries.ITEM.getKey(backpack.getItem()).toString();
        if (id.contains("copper"))
            capacity = 36;
        else if (id.contains("iron"))
            capacity = 45;
        else if (id.contains("golden"))
            capacity = 54;
        else if (id.contains("diamond"))
            capacity = 63;
        else if (id.contains("netherite"))
            capacity = 72;

        net.minecraft.world.item.component.ItemContainerContents contents = backpack.getOrDefault(
                net.minecraft.core.component.DataComponents.CONTAINER,
                net.minecraft.world.item.component.ItemContainerContents.EMPTY);

        net.minecraft.core.NonNullList<ItemStack> list = net.minecraft.core.NonNullList.withSize(capacity,
                ItemStack.EMPTY);
        contents.copyInto(list);

        for (int i = 0; i < capacity; i++) {
            if (incoming.isEmpty())
                break;
            ItemStack slotStack = list.get(i);
            if (slotStack.isEmpty()) {
                list.set(i, incoming.copy());
                incoming.setCount(0);
            } else if (ItemStack.isSameItemSameComponents(slotStack, incoming)) {
                int space = slotStack.getMaxStackSize() - slotStack.getCount();
                if (space > 0) {
                    int toAdd = Math.min(space, incoming.getCount());
                    slotStack.grow(toAdd);
                    incoming.shrink(toAdd);
                }
            }
        }

        backpack.set(net.minecraft.core.component.DataComponents.CONTAINER,
                net.minecraft.world.item.component.ItemContainerContents.fromItems(list));
        return incoming;
    }
}
