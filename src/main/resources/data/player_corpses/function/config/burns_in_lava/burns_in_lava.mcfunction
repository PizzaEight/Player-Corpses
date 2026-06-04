execute unless score Config burns_in_lava matches 1 run return fail
execute if score Config burns_in_lava matches 1 run schedule function player_corpses:config/burns_in_lava/burns_in_lava 1 

execute unless score Config has_gore matches 1 if score Config burns_in_lava matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s unless data entity @s {Fire:0s} run function player_corpses:config/burns_in_lava/die_lava
execute if score Config has_gore matches 1 if score Config burns_in_lava matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s unless data entity @s {Fire:0s} run function player_corpses:config/burns_in_lava/die_lava_gore