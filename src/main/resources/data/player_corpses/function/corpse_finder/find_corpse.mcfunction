execute store result storage player_corpses:corpse_coordinates x float 1 run data get entity @s Pos[0] 1
execute store result storage player_corpses:corpse_coordinates y float 1 run data get entity @s Pos[1] 1
execute store result storage player_corpses:corpse_coordinates z float 1 run data get entity @s Pos[2] 1
execute store result score @s player_corpses.x run data get entity @s Pos[0] 1
execute store result score @s player_corpses.y run data get entity @s Pos[1] 1
execute store result score @s player_corpses.z run data get entity @s Pos[2] 1

scoreboard players operation @s player_corpses.time = Config player_corpses.time
scoreboard players operation @s player_corpses.time -= @s player_corpses.spawn_time

function player_corpses:corpse_finder/print_coords
effect give @e[type=mannequin,tag=player_corpses.corpse] minecraft:glowing 3 0 true
effect give @e[tag=player_corpses.zombie] minecraft:glowing 3 0 true