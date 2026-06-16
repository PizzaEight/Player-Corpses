execute at @s run playsound minecraft:entity.generic.hurt player @a ~ ~ ~ 0.2 0.8

execute store result score Config player_corpses.percent run random value 1..3
execute if score Config player_corpses.percent matches 1 run tag @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] add player_corpses.bloody
execute if score Config player_corpses.percent matches 2 run tag @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] add player_corpses.boney
execute unless entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.bloody] unless entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.boney] run return fail

execute store result score Config player_corpses.percent run random value 1..100
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.bloody] at @s run summon item ~ ~0.2 ~ {Age:5970,Tags:["player_corpses.new","player_corpses.bone","player_corpses.blood"],PickupDelay:655340,Item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item},"!minecraft:consumable":{},"minecraft:item_model":"redstone","minecraft:max_stack_size":1}}}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood] if score Config player_corpses.percent matches 1..25 run tag @s add player_corpses.1
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood] if score Config player_corpses.percent matches 26..50 run tag @s add player_corpses.2
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood] if score Config player_corpses.percent matches 51..75 run tag @s add player_corpses.3
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood] if score Config player_corpses.percent matches 76..100 run tag @s add player_corpses.4

execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood,tag=player_corpses.1] run data merge entity @s {Motion:[0.1, 0.2, 0.1]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood,tag=player_corpses.2] run data merge entity @s {Motion:[-0.1, 0.2, -0.1]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood,tag=player_corpses.3] run data merge entity @s {Motion:[0.1, 0.2, -0.1]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=player_corpses.blood,tag=player_corpses.4] run data merge entity @s {Motion:[-0.1, 0.2, 0.1]}

execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.boney,tag=!player_corpses.bloody] at @s run summon item ~ ~0.2 ~ {Age:5970,Tags:["player_corpses.new","player_corpses.bone"],PickupDelay:655340,Item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item},"!minecraft:consumable":{},"minecraft:item_model":"bone","minecraft:max_stack_size":1}}}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood] if score Config player_corpses.percent matches 1..25 run tag @s add player_corpses.1
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood] if score Config player_corpses.percent matches 26..50 run tag @s add player_corpses.2
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood] if score Config player_corpses.percent matches 51..75 run tag @s add player_corpses.3
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood] if score Config player_corpses.percent matches 76..100 run tag @s add player_corpses.4

execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood,tag=player_corpses.1] run data merge entity @s {Motion:[0.0, 0.2, 0.1]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood,tag=player_corpses.2] run data merge entity @s {Motion:[-0.1, 0.2, 0.0]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood,tag=player_corpses.3] run data merge entity @s {Motion:[0.1, 0.2, 0.0]}
execute as @e[type=item,tag=player_corpses.bone,tag=player_corpses.new,tag=!player_corpses.blood,tag=player_corpses.4] run data merge entity @s {Motion:[0.0, 0.2, -0.1]}
tag @e[type=item,tag=player_corpses.bone,tag=player_corpses.new] remove player_corpses.new
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.bloody] at @s run playsound minecraft:block.honey_block.break player @a ~ ~ ~ 0.1 0.5
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.boney,tag=!player_corpses.bloody] at @s run playsound minecraft:entity.generic.big_fall player @a ~ ~ ~ 0.1 0
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.boney,tag=!player_corpses.bloody] at @s run playsound minecraft:block.metal.break player @a ~ ~ ~ 0.1 1.2
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept,tag=player_corpses.boney,tag=!player_corpses.bloody] at @s run playsound minecraft:entity.generic.hurt player @a ~ ~ ~ 0.05 0.8
tag @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] remove player_corpses.bloody
tag @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] remove player_corpses.boney