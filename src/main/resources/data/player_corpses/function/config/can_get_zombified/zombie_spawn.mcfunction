summon minecraft:zombie ~ ~ ~ {DeathLootTable:"entity/armor_stand",PersistenceRequired:1b,CanPickUpLoot:0b,IsBaby:0b,CanBreakDoors:1b,Tags:["player_corpses.zombie","fresh"],CustomName:"",drop_chances:{feet:0.000,legs:0.000,chest:0.000,head:0.000,mainhand:0.000,offhand:0.000},Passengers:[{id:"minecraft:armor_stand",Silent:1b,Invulnerable:1b,Small:1b,Marker:1b,ShowArms:1b,Invisible:1b,CustomName:"",Tags:["player_corpses.stand","player_corpses.corpse","fresh"],DisabledSlots:4144959,equipment:{mainhand:{id:"minecraft:shulker_box",count:1,components:{"minecraft:item_model":"air"}},offhand:{id:"minecraft:shulker_box",count:1,components:{"minecraft:item_model":"air"}}}}]}
effect clear @s minecraft:regeneration
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] active_effects set from entity @s active_effects
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] AbsorptionAmount set from entity @s AbsorptionAmount
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] Rotation set from entity @s Rotation
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] equipment set from entity @s equipment
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] equipment.mainhand set from entity @s SelectedItem
loot replace entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] armor.head loot player_corpses:entities/get_name

execute on vehicle run ride @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] mount @s
execute unless score Config has_player_name matches 1 run tag @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] add player_corpses.unnamed_zombie
execute if score Config has_player_name matches 1 run tag @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] add player_corpses.named_zombie

execute if score Config has_player_name matches 1 as @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] at @s run data modify entity @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] CustomName set from entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] equipment.head.components.minecraft:profile.name
execute if score Config has_player_name matches 1 as @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] at @s run data merge entity @s {CustomNameVisible:1b}

execute as @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] at @s run data modify entity @s CustomName set from entity @s equipment.head.components.minecraft:profile.name
execute store result score @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] player_corpses.xp_levels run experience query @s levels
execute store result score @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] player_corpses.xp_points run experience query @s points

scoreboard players operation @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] player_corpses.spawn_time = Config player_corpses.time

data modify storage player_corpses:name name set from entity @n[type=minecraft:zombie,tag=player_corpses.zombie,tag=fresh] CustomName
execute as @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] run function player_corpses:give_tag with storage player_corpses:name
execute as @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] run function player_corpses:remove_latest_tag with storage player_corpses:name
tag @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] add player_corpses.latest


execute unless data entity @s equipment unless data entity @s Inventory[] run tag @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh] add player_corpses.poor

execute unless score Config gives_player_head matches 1 as @s at @s if entity @n[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=fresh,tag=!player_corpses.poor] run function player_corpses:items_add
execute if score Config gives_player_head matches 1 as @s at @s run function player_corpses:items_add

data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] Pos[0] set from storage player_corpses:death_coords x
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] Pos[1] set from storage player_corpses:death_coords y
data modify entity @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] Pos[2] set from storage player_corpses:death_coords z
execute at @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] run playsound minecraft:entity.zombie.infect player @a ~ ~ ~ 1
execute at @n[type=#player_corpses:zombie,tag=player_corpses.zombie,tag=fresh] run playsound minecraft:entity.zombie.ambient player @a ~ ~ ~ 0.5 0

tag @e[type=#player_corpses:zombie,tag=player_corpses.zombie] remove fresh
tag @e[type=minecraft:armor_stand,tag=player_corpses.corpse] remove fresh
tag @s remove player_corpses.zombie