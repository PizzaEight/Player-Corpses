summon minecraft:mannequin ~ ~ ~ {Team:"player_corpses.corpse_friend",Silent:1b,pose:sleeping,Tags:["player_corpses.corpse","fresh","player_corpses.loaded"],CustomNameVisible:1b,CustomName:"",description:{"color":aqua,"text":"Sneak here to get your items back"}}
scoreboard players set @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.corpse_version 30
loot replace entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] weapon.mainhand loot player_corpses:entities/get_name
data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] CustomName set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] equipment.mainhand.components.minecraft:profile.name
data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] profile set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] equipment.mainhand.components.minecraft:profile.name
item replace entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] weapon.mainhand with air
data modify storage player_corpses:name name set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] profile.name
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] run function player_corpses:give_tag with storage player_corpses:name
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] run function player_corpses:remove_latest_tag with storage player_corpses:name
tag @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] add player_corpses.latest
data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] equipment set from entity @s equipment
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.uuid run data get entity @s UUID[0]
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.uuid2 run data get entity @s UUID[1]
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.uuid3 run data get entity @s UUID[2]
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.uuid4 run data get entity @s UUID[3]
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.xp_levels run experience query @s levels
execute store result score @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.xp_points run experience query @s points

scoreboard players operation @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] player_corpses.spawn_time = Config player_corpses.time

execute unless items entity @s player.crafting.* * unless items entity @s player.cursor * unless data entity @s trinkets unless data entity @s cardinal_components.trinkets:trinkets unless data entity @s neoforge:attachments.curios unless data entity @s forge:attachments.curios unless data entity @s equipment unless data entity @s Inventory[] run tag @n[tag=player_corpses.corpse,tag=fresh] add player_corpses.poor
execute unless items entity @s hotbar.* * run tag @n[tag=player_corpses.corpse,tag=fresh] add player_corpses.hotbar_poor
execute unless items entity @s inventory.* * run tag @n[tag=player_corpses.corpse,tag=fresh] add player_corpses.inventory_poor
execute unless items entity @s armor.* * run tag @n[tag=player_corpses.corpse,tag=fresh] add player_corpses.armor_poor

execute as @s at @s if entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh,tag=!player_corpses.poor] run function player_corpses:items_add/items_add
execute as @s at @s if entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh,tag=player_corpses.poor] run function player_corpses:items_add/items_add_poor

execute unless items entity @s armor.chest * run item replace entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] armor.chest with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"chest",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
execute unless items entity @s armor.legs * run item replace entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] armor.legs with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"legs",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
execute unless items entity @s armor.feet * run item replace entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] armor.feet with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"feet",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]

execute unless items entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] weapon.offhand * run tag @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] add player_corpses.offhandless 

effect give @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] minecraft:resistance infinite 255 true
effect give @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] minecraft:fire_resistance infinite 255 true
effect give @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] minecraft:water_breathing infinite 255 true

data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] Pos[0] set from storage player_corpses:death_coords x
data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] Pos[1] set from storage player_corpses:death_coords y
data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] Pos[2] set from storage player_corpses:death_coords z
tp @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] ~ ~0.5 ~
execute if score Config has_gore matches 1 as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=fresh] at @s run function player_corpses:config/has_gore/die_gore
tag @e[type=minecraft:mannequin,tag=player_corpses.corpse] remove fresh

function player_corpses:countdown
execute if score Config despawn_timer matches 1.. run function player_corpses:config/despawn_timer/despawn_timer_apply
execute if score Config can_be_looted_from_right_clicking matches 1 run function player_corpses:config/can_be_looted_by_right_clicking/right_click_apply
