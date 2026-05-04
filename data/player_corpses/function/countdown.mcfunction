schedule function player_corpses:countdown 1s
execute if entity @e[type=minecraft:mannequin,tag=player_corpses.corpse] run function player_corpses:countdown_corpse
execute as @e[type=minecraft:text_display,tag=player_corpses.killable] at @s unless predicate player_corpses:on_corpse run kill @s
execute as @e[type=minecraft:armor_stand,tag=player_corpses.corpse] on vehicle run data merge entity @s {DeathLootTable:"entity/armor_stand"}
execute unless score Config has_player_name matches 1 if entity @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=player_corpses.named_zombie] run function player_corpses:config/can_get_zombified/remove_name
execute if score Config has_player_name matches 1 if entity @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=player_corpses.unnamed_zombie] run function player_corpses:config/can_get_zombified/add_name