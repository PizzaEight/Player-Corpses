execute unless score Config floats_in_water matches 1 run return fail
execute if score Config floats_in_water matches 1 run schedule function player_corpses:config/floats_in_water/floats_in_water 1
execute if score Config floats_in_water matches 1 unless entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,predicate=player_corpses:in_water] run return fail
execute if score Config floats_in_water matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s if block ~ ~ ~ water[level=0] if block ~ ~0.3 ~ #player_corpses:passable_water run tp @s ~ ~0.05 ~
execute if score Config floats_in_water matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s if block ~ ~0.2 ~ water[level=1] if block ~ ~0.3 ~ #player_corpses:passable_water run tp @s ~ ~0.05 ~
execute if score Config floats_in_water matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s if block ~ ~0.4 ~ water[level=2] if block ~ ~0.3 ~ #player_corpses:passable_water run tp @s ~ ~0.05 ~
execute if score Config floats_in_water matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s if block ~ ~ ~ water unless block ~ ~ ~ water[level=0] unless block ~ ~ ~ water[level=1] unless block ~ ~ ~ water[level=2] if block ~ ~1 ~ water run tp @s ~ ~0.05 ~
execute if score Config floats_in_water matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s if predicate player_corpses:in_water unless block ~ ~ ~ water run tp @s ~ ~0.05 ~
