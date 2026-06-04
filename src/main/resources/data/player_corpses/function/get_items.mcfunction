corpse_api restore_modded_inv @s @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching]

execute store result storage player_corpses:death_coords xp_levels double 1 run scoreboard players get @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] player_corpses.xp_levels
execute store result storage player_corpses:death_coords xp_points double 1 run scoreboard players get @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] player_corpses.xp_points
execute as @s if score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] player_corpses.xp_levels matches 1.. run playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.5 1
execute as @s at @s if score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] player_corpses.xp_points matches 1.. unless score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] player_corpses.xp_levels matches 1.. run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.5 1
execute as @s run function player_corpses:give_xp with storage player_corpses:death_coords

execute as @s as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s unless score Config stays_after_being_looted matches 1 unless score Config has_gore matches 1 run particle minecraft:cloud ~ ~1 ~ 0.5 0.2 0.5 0.08 12 normal
execute as @s as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s unless score Config stays_after_being_looted matches 1 unless score Config has_gore matches 1 run playsound minecraft:item.chorus_fruit.teleport player @a ~ ~ ~ 1 0
execute as @s as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s unless score Config stays_after_being_looted matches 1 unless score Config has_gore matches 1 run tp ~ -100000 ~
execute as @s as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s if score Config stays_after_being_looted matches 1 if score Config has_gore matches 1 run function player_corpses:config/has_gore/remove_gore
execute as @s as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s unless score Config stays_after_being_looted matches 1 if score Config has_gore matches 1 run function player_corpses:config/despawn_timer/despawn_gore

execute if score Config stays_after_being_looted matches 1 as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] at @s run function player_corpses:config/stays_after_being_looted/keep_corpse

tag @e[type=minecraft:mannequin,tag=player_corpses.corpse] remove player_corpses.searching