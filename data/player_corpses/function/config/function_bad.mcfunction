execute as @a[scores={config=11016}] run function player_corpses:config/show
execute as @a[scores={config=11016}] if entity @s[gamemode=creative] run scoreboard players set Config remove_config 0
execute if score Config remove_config matches 1 unless score @s config matches 22000 unless score @s config matches 11016 unless score @s config matches 1016 run tellraw @s [{"color":"dark_red","text":"you cannot access this, config screen access is disabled"}]
