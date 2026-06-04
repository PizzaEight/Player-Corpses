execute as @a[scores={config=11016}] run function player_corpses:config/show
execute if score Config remove_config matches 1 unless score @s config matches 22000 unless score @s config matches 11016 run tellraw @s [{"color":"dark_red","text":"you cannot access this unless in creative mode, config access is disiabled"}]
scoreboard players reset @a config
scoreboard players enable @a config