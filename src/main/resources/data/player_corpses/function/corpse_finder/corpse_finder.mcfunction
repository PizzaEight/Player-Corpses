execute if entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] if score Config remove_corpse_finder matches 0 run tellraw @a[scores={corpse_finder=1..}] {"bold":true,"color":"gold","text":"Corpse Finder"}
execute if entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] if score Config remove_corpse_finder matches 0 run tellraw @a[scores={corpse_finder=1..}] {"bold":true,"color":"gold","text":"============================================="}
execute if entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] if score Config remove_corpse_finder matches 0 run tellraw @a[scores={corpse_finder=1..}] {"bold":true,"color":"blue","text":"Currently Loaded Corpses"}
execute if entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] if score Config remove_corpse_finder matches 0 as @e[type=!minecraft:text_display,tag=player_corpses.corpse] at @s run function player_corpses:corpse_finder/find_corpse

execute if entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] if score Config remove_corpse_finder matches 0 run tellraw @a[scores={corpse_finder=1..}] {"bold":true,"color":"gold","text":"============================================="}
execute unless score Config remove_corpse_finder matches 0 run tellraw @a[scores={corpse_finder=1..}] {"bold":false,"color":"red","text":"Corpse Finder is disabled in the config!"}
execute unless score Config remove_corpse_finder matches 0 as @a[scores={corpse_finder=1..}] at @s run playsound minecraft:block.note_block.didgeridoo ui @s ~ ~ ~ 1 0
execute unless entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] run playsound minecraft:block.note_block.didgeridoo ui @s ~ ~ ~ 1 0
execute unless entity @e[type=!minecraft:text_display,tag=player_corpses.corpse] run tellraw @a[scores={corpse_finder=1..}] {"bold":false,"color":"red","text":"No corpses found in any currently loaded chunks!"}
scoreboard players reset @a corpse_finder
scoreboard players enable @a corpse_finder