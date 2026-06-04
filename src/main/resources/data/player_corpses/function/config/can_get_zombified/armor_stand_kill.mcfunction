execute at @s run summon item ~ ~-1.85 ~ {Tags:["player_corpses.inventory"],Item:{id:"minecraft:shulker_box",count:1,components:{"minecraft:tooltip_display":{hide_tooltip:true},"minecraft:item_model":"air","minecraft:container":[{slot:0,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}},{slot:1,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}},{slot:2,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}}]}}}

data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[0].item set from entity @s equipment.head.components.minecraft:container[0].item
data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[1].item set from entity @s equipment.head.components.minecraft:container[1].item 
execute if score Config gives_player_head matches 1 on vehicle run data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[2].item set from entity @s equipment.head

execute as @e[type=item,tag=player_corpses.inventory] run damage @s 20
execute as @e[tag=!player_corpses.bone,nbt={Item:{components:{"minecraft:custom_data":{player_corpses:item}}}}] run damage @s 20
execute as @e[tag=!player_corpses.bone,nbt={Item:{components:{"minecraft:custom_data":{player_corpses:item}}}}] run damage @s 20
summon minecraft:experience_orb ~ ~-1.85 ~ {Value:0,Tags:["player_corpses.orb","fresh"]}
scoreboard players operation @n[type=minecraft:experience_orb,tag=player_corpses.orb,tag=fresh] player_corpses.xp_levels = @s player_corpses.xp_levels
scoreboard players operation @n[type=minecraft:experience_orb,tag=player_corpses.orb,tag=fresh] player_corpses.xp_points = @s player_corpses.xp_points
tag @e[type=experience_orb,tag=player_corpses.orb,tag=fresh] remove fresh
kill @s