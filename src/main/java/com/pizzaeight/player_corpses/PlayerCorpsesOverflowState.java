package com.pizzaeight.player_corpses;

import com.mojang.serialization.Codec;
import com.mojang.serialization.codecs.RecordCodecBuilder;
import net.minecraft.core.UUIDUtil;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.util.datafix.DataFixTypes;
import net.minecraft.world.level.saveddata.SavedData;
import net.minecraft.world.level.saveddata.SavedDataType;
import net.minecraft.world.item.ItemStack;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

public class PlayerCorpsesOverflowState extends SavedData {

    public static final Codec<PlayerCorpsesOverflowState> CODEC = RecordCodecBuilder.create(
        i -> i.group(
            Codec.unboundedMap(UUIDUtil.STRING_CODEC, ItemStack.CODEC.listOf()).optionalFieldOf("overflowItems", new HashMap<>()).forGetter(d -> d.overflowItems)
        ).apply(i, PlayerCorpsesOverflowState::new)
    );

    public final Map<UUID, List<ItemStack>> overflowItems;

    public PlayerCorpsesOverflowState() {
        this.overflowItems = new HashMap<>();
    }

    private PlayerCorpsesOverflowState(Map<UUID, List<ItemStack>> overflowItems) {
        this.overflowItems = new HashMap<>();
        for (Map.Entry<UUID, List<ItemStack>> entry : overflowItems.entrySet()) {
            this.overflowItems.put(entry.getKey(), new ArrayList<>(entry.getValue()));
        }
    }

    public static SavedDataType<PlayerCorpsesOverflowState> type() {
        return new SavedDataType<>(
            Identifier.withDefaultNamespace("player_corpses_overflow"),
            PlayerCorpsesOverflowState::new,
            CODEC,
            DataFixTypes.SAVED_DATA_COMMAND_STORAGE
        );
    }

    public static PlayerCorpsesOverflowState get(ServerLevel level) {
        return level.getServer().overworld().getDataStorage().computeIfAbsent(type());
    }

    public void addOverflow(UUID player, ItemStack stack) {
        if (stack.isEmpty()) return;
        List<ItemStack> list = this.overflowItems.computeIfAbsent(player, k -> new ArrayList<>());
        
        ItemStack remainder = stack.copy();
        
        for (ItemStack existing : list) {
            if (remainder.isEmpty()) break;
            if (ItemStack.isSameItemSameComponents(existing, remainder)) {
                int space = existing.getMaxStackSize() - existing.getCount();
                if (space > 0) {
                    int toAdd = Math.min(space, remainder.getCount());
                    existing.grow(toAdd);
                    remainder.shrink(toAdd);
                }
            }
        }
        
        if (!remainder.isEmpty()) {
            list.add(remainder);
        }
        this.setDirty();
    }
    
    public List<ItemStack> getOverflow(UUID player) {
        return this.overflowItems.getOrDefault(player, new ArrayList<>());
    }
    
    public void setOverflow(UUID player, List<ItemStack> items) {
        if (items.isEmpty()) {
            this.overflowItems.remove(player);
        } else {
            this.overflowItems.put(player, new ArrayList<>(items));
        }
        this.setDirty();
    }
}
