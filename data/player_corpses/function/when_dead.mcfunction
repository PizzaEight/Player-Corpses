scoreboard players set @s player_corpses.died 0
execute if entity @s[gamemode=spectator] run return fail

execute store result score @s player_corpses.x run data get entity @s LastDeathLocation.pos[0]
execute store result score @s player_corpses.y run data get entity @s LastDeathLocation.pos[1]
execute store result score @s player_corpses.z run data get entity @s LastDeathLocation.pos[2]

scoreboard players set Config player_corpses.dimention 0
execute if dimension minecraft:overworld run scoreboard players set Config player_corpses.dimention 1
execute if dimension minecraft:the_nether run scoreboard players set Config player_corpses.dimention 2
execute if dimension minecraft:the_end run scoreboard players set Config player_corpses.dimention 3

execute if score Config player_corpses.dimention matches 1 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!survival,gamemode=!adventure] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in overworld"},{"text":" "},{"color":"aqua","click_event":{"action":"run_command","command":"/trigger config set 22000"},"text":"[TP to Last Death]"}]
execute if score Config player_corpses.dimention matches 2 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!survival,gamemode=!adventure] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in the nether"},{"text":" "},{"color":"aqua","click_event":{"action":"run_command","command":"/trigger config set 22000"},"text":"[TP to Last Death]"}]
execute if score Config player_corpses.dimention matches 3 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!survival,gamemode=!adventure] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in the end"},{"text":" "},{"color":"aqua","click_event":{"action":"run_command","command":"/trigger config set 22000"},"text":"[TP to Last Death]"}]
execute if score Config player_corpses.dimention matches 0 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!survival,gamemode=!adventure] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in <unknown>"},{"text":" "},{"color":"aqua","click_event":{"action":"run_command","command":"/trigger config set 22000"},"text":"[TP to Last Death]"}]

execute if score Config player_corpses.dimention matches 1 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!creative,gamemode=!spectator] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in overworld"}]
execute if score Config player_corpses.dimention matches 2 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!creative,gamemode=!spectator] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in the nether"}]
execute if score Config player_corpses.dimention matches 3 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!creative,gamemode=!spectator] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in the end"}]
execute if score Config player_corpses.dimention matches 0 if score Config gives_death_coords matches 1 run tellraw @s[gamemode=!creative,gamemode=!spectator] [{"color":"gold","text":"Died at: "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.x"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.y"}},{"text":" "},{"color":"gold","score":{"name":"@s","objective":"player_corpses.z"}},{"color":"gold","text":" in <unknown>"}]

execute if score Config saves_items_from_void matches 1 if predicate player_corpses:in_void unless predicate player_corpses:in_overworld store result score @s player_corpses.y run scoreboard players get Config load
execute if score Config saves_items_from_void matches 1 if predicate player_corpses:in_void_overworld if predicate player_corpses:in_overworld store result score @s player_corpses.y run scoreboard players get Config -63

scoreboard players operation @s player_corpses.x *= Config player_corpses.10
scoreboard players operation @s player_corpses.z *= Config player_corpses.10

scoreboard players add @s player_corpses.x 5
scoreboard players add @s player_corpses.z 5

execute store result storage player_corpses:death_coords x float 0.1 run scoreboard players get @s player_corpses.x
execute store result storage player_corpses:death_coords y float 1 run scoreboard players get @s player_corpses.y
execute store result storage player_corpses:death_coords z float 0.1 run scoreboard players get @s player_corpses.z

scoreboard players remove @s player_corpses.x 5
scoreboard players remove @s player_corpses.z 5

scoreboard players operation @s player_corpses.x /= Config player_corpses.10
scoreboard players operation @s player_corpses.z /= Config player_corpses.10

clear @s *[enchantments~[{enchantments:"minecraft:vanishing_curse"}]]

execute if entity @s[tag=!player_corpses.zombie,tag=!player_corpses.husk,tag=!player_corpses.drowned] run function player_corpses:corpse_spawn
execute if score Config can_get_zombified matches 1 if entity @s[tag=player_corpses.zombie] run function player_corpses:config/can_get_zombified/zombie_spawn
execute if score Config can_get_zombified matches 1 if entity @s[tag=player_corpses.husk] run function player_corpses:config/can_get_zombified/husk_spawn
execute if score Config can_get_zombified matches 1 if entity @s[tag=player_corpses.drowned] run function player_corpses:config/can_get_zombified/drowned_spawn
xp set @s 0 levels
xp set @s 0
clear

