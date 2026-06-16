execute as @a[scores={config=22000}] run function player_corpses:last_death

execute unless score Config remove_config matches 1 run function player_corpses:config/function_configs

execute if entity @s[gamemode=!creative] if score Config remove_config matches 1 run function player_corpses:config/function_bad

execute if entity @s[gamemode=creative] if score Config remove_config matches 1 run function player_corpses:config/function_configs

scoreboard players reset @a config
scoreboard players enable @a config