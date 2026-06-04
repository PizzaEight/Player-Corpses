execute at @s run summon item ~ ~0.5 ~ {Tags:["player_corpses.inventory"],Item:{id:"minecraft:shulker_box",count:1,components:{"minecraft:tooltip_display":{hide_tooltip:true},"minecraft:item_model":"air","minecraft:container":[{slot:0,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}},{slot:1,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}},{slot:2,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}},{slot:3,item:{id:"minecraft:poisonous_potato",count:1,components:{"minecraft:item_model":"air","minecraft:tooltip_display":{hide_tooltip:true},"minecraft:custom_data":{player_corpses:item}}}}]}}}

execute unless score Config gives_player_head matches 1 run data modify entity @s equipment.head.components.minecraft:container[1].item.components.minecraft:container[14] set value air
data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[0].item set from entity @s equipment.head.components.minecraft:container[0].item
data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[1].item set from entity @s equipment.head.components.minecraft:container[1].item  
execute if entity @s[tag=player_corpses.offhandless] run data modify entity @n[type=item,tag=player_corpses.inventory] Item.components.minecraft:container[2].item set from entity @s equipment.offhand

execute as @e[type=item,tag=player_corpses.inventory] run damage @s 20
execute as @e[tag=!player_corpses.bone,nbt={Item:{components:{"minecraft:custom_data":{player_corpses:item}}}}] run damage @s 20
execute as @e[tag=!player_corpses.bone,nbt={Item:{components:{"minecraft:custom_data":{player_corpses:item}}}}] run damage @s 20
summon minecraft:experience_orb ~ ~0.5 ~ {Value:0,Tags:["player_corpses.orb","fresh"]}
scoreboard players operation @n[type=minecraft:experience_orb,tag=player_corpses.orb,tag=fresh] player_corpses.xp_levels = @s player_corpses.xp_levels
scoreboard players operation @n[type=minecraft:experience_orb,tag=player_corpses.orb,tag=fresh] player_corpses.xp_points = @s player_corpses.xp_points
tag @e[type=experience_orb,tag=player_corpses.orb,tag=fresh] remove fresh
particle lava ~ ~1 ~ 0.3 0.3 0.3 0 50
particle flame ~ ~1 ~ 0.4 0.6 0.4 0 50
particle minecraft:campfire_cosy_smoke ~ ~1 ~ 0.5 0.5 0.5 0.03 10
execute at @s run playsound minecraft:entity.player.hurt_on_fire player @a ~ ~ ~ 1 0.8
execute at @s run playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1 0.8
tp @s ~ -10000 ~