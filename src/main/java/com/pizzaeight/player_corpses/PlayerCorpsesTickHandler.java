package com.pizzaeight.player_corpses;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.item.ItemStack;

import java.util.ArrayList;
import java.util.List;

public class PlayerCorpsesTickHandler {
    private static int tickCounter = 0;

    public static void register() {
        ServerTickEvents.END_SERVER_TICK.register(server -> {
            tickCounter++;
            if (tickCounter >= 2) { // Every 2 ticks (0.1 seconds)
                tickCounter = 0;
                PlayerCorpsesOverflowState state = PlayerCorpsesOverflowState.get(server.overworld());
                for (ServerPlayer player : server.getPlayerList().getPlayers()) {
                    List<ItemStack> overflow = state.getOverflow(player.getUUID());
                    if (!overflow.isEmpty()) {
                        List<ItemStack> newOverflow = new ArrayList<>();
                        boolean changed = false;
                        for (ItemStack stack : overflow) {
                            if (stack.isEmpty()) continue;
                            
                            ItemStack remainder = PlayerCorpsesMod.insertItemSmart(player, stack.copy());
                            if (remainder.isEmpty()) {
                                changed = true; // Item fully inserted, do not add to newOverflow
                            } else if (remainder.getCount() < stack.getCount()) {
                                changed = true; // Item partially inserted
                                newOverflow.add(remainder);
                            } else {
                                newOverflow.add(stack); // Nothing inserted
                            }
                        }
                        if (changed) {
                            state.setOverflow(player.getUUID(), newOverflow);
                            player.containerMenu.broadcastChanges();
                            player.inventoryMenu.broadcastChanges();
                        }
                    }
                }
            }
        });
    }
}
