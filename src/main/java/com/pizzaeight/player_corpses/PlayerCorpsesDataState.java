package com.pizzaeight.player_corpses;

import com.mojang.serialization.Codec;
import com.mojang.serialization.codecs.RecordCodecBuilder;
import net.minecraft.core.UUIDUtil;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.util.datafix.DataFixTypes;
import net.minecraft.world.level.saveddata.SavedData;
import net.minecraft.world.level.saveddata.SavedDataType;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

public class PlayerCorpsesDataState extends SavedData {

    public static class CorpseData {
        public static final Codec<CorpseData> CODEC = RecordCodecBuilder.create(
            i -> i.group(
                CompoundTag.CODEC.listOf().optionalFieldOf("standardInv", new ArrayList<>()).forGetter(d -> d.standardInv),
                CompoundTag.CODEC.listOf().optionalFieldOf("trinkets", new ArrayList<>()).forGetter(d -> d.trinkets)
            ).apply(i, CorpseData::new)
        );

        public final List<CompoundTag> standardInv;
        public final List<CompoundTag> trinkets;

        public CorpseData(List<CompoundTag> standardInv, List<CompoundTag> trinkets) {
            this.standardInv = standardInv;
            this.trinkets = trinkets;
        }
    }

    public static final Codec<PlayerCorpsesDataState> CODEC = RecordCodecBuilder.create(
        i -> i.group(
            Codec.unboundedMap(UUIDUtil.STRING_CODEC, CorpseData.CODEC).optionalFieldOf("corpses", new HashMap<>()).forGetter(d -> d.corpses)
        ).apply(i, PlayerCorpsesDataState::new)
    );

    public final Map<UUID, CorpseData> corpses;

    public PlayerCorpsesDataState() {
        this.corpses = new HashMap<>();
    }

    private PlayerCorpsesDataState(Map<UUID, CorpseData> corpses) {
        this.corpses = new HashMap<>(corpses);
    }

    public static SavedDataType<PlayerCorpsesDataState> type() {
        return new SavedDataType<>(
            Identifier.withDefaultNamespace("player_corpses_data"),
            PlayerCorpsesDataState::new,
            CODEC,
            DataFixTypes.SAVED_DATA_COMMAND_STORAGE
        );
    }

    public static PlayerCorpsesDataState get(ServerLevel level) {
        return level.getServer().overworld().getDataStorage().computeIfAbsent(type());
    }

    public void setCorpseData(UUID corpseId, List<CompoundTag> standardInv, List<CompoundTag> trinkets) {
        this.corpses.put(corpseId, new CorpseData(new ArrayList<>(standardInv), new ArrayList<>(trinkets)));
        this.setDirty();
    }
    
    public CorpseData getCorpseData(UUID corpseId) {
        return this.corpses.get(corpseId);
    }
    
    public void removeCorpseData(UUID corpseId) {
        this.corpses.remove(corpseId);
        this.setDirty();
    }
}
