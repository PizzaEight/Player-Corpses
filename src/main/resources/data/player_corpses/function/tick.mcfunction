execute as @a[scores={player_corpses.died=1..}] at @s run function player_corpses:when_dead
execute as @e[type=minecraft:armor_stand,tag=player_corpses.corpse] at @s unless predicate player_corpses:zombie_vehicle run function player_corpses:config/can_get_zombified/armor_stand_kill
execute as @a[gamemode=!spectator] at @s if entity @e[type=minecraft:experience_orb,tag=player_corpses.orb,distance=0..4] run function player_corpses:config/can_get_zombified/orb_kill
execute as @a[scores={config=1..}] run function player_corpses:config/function
execute as @a[scores={corpse_finder=1..}] run function player_corpses:corpse_finder/corpse_finder
