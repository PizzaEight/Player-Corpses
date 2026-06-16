execute store result storage player_corpses:death_coords x float 1 run scoreboard players get @s player_corpses.x
execute store result storage player_corpses:death_coords y float 1 run scoreboard players get @s player_corpses.y
execute store result storage player_corpses:death_coords z float 1 run scoreboard players get @s player_corpses.z

execute if score Config player_corpses.dimention matches 0 as @s[gamemode=!survival,gamemode=!adventure] run function player_corpses:tp_last_death with storage player_corpses:death_coords
execute if score Config player_corpses.dimention matches 0 as @s[gamemode=!survival,gamemode=!adventure] run title @s actionbar {"color":"dark_red","text":"INVALID DIMENTION /// ERROR 404"}
execute if score Config player_corpses.dimention matches 1 as @s[gamemode=!survival,gamemode=!adventure] in minecraft:overworld run function player_corpses:tp_last_death with storage player_corpses:death_coords
execute if score Config player_corpses.dimention matches 2 as @s[gamemode=!survival,gamemode=!adventure] in minecraft:the_nether run function player_corpses:tp_last_death with storage player_corpses:death_coords
execute if score Config player_corpses.dimention matches 3 as @s[gamemode=!survival,gamemode=!adventure] in minecraft:the_end run function player_corpses:tp_last_death with storage player_corpses:death_coords

execute as @s[gamemode=!creative,gamemode=!spectator] at @s run function player_corpses:tp_fail