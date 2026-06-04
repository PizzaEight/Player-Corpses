execute at @e[type=minecraft:mannequin,tag=player_corpses.corpse] run team join player_corpses.corpse_friend @e[distance=0..16,type=minecraft:warden,team=!player_corpses.corpse_friend]

execute if score Config can_be_looted_from_right_clicking matches 1 as @e[type=minecraft:interaction,tag=player_corpses.interaction,predicate=!player_corpses:corpse_vehicle] at @s run ride @s mount @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.right_clickable,tag=!player_corpses.kept,predicate=!player_corpses:interactable]

execute as @a[gamemode=!spectator,predicate=player_corpses:shift_key] at @s unless entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] run scoreboard players set @s player_corpses.score 5
execute as @a[gamemode=!spectator,nbt={OnGround:1b}] at @s unless score Config can_be_looted_from_right_clicking matches 1 if predicate player_corpses:shift_key if entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] run function player_corpses:count
execute as @a[gamemode=!spectator,nbt={OnGround:1b}] at @s if predicate player_corpses:shift_key if entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..2,tag=!player_corpses.kept] run scoreboard players remove @s player_corpses.score 1
execute as @a[gamemode=!spectator] at @s unless predicate player_corpses:shift_key run scoreboard players set @s player_corpses.score 5
execute as @a[gamemode=!spectator] at @s unless predicate player_corpses:shift_key run tag @s remove player_corpses.correct
execute as @a[gamemode=!spectator] at @s unless predicate player_corpses:shift_key unless score Config can_be_looted_from_right_clicking matches 1 run tag @s remove player_corpses.msg_cooldown

execute unless predicate player_corpses:in_overworld if score Config saves_items_from_void matches 1 at @a[gamemode=!spectator] as @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..11,nbt={OnGround:0b}] at @s if predicate player_corpses:on_void run particle minecraft:end_rod ~ ~ ~ 0.2 0.1 0.2 0 4
execute if predicate player_corpses:in_overworld if score Config saves_items_from_void matches 1 at @a[gamemode=!spectator] as @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..11,nbt={OnGround:0b}] at @s if predicate player_corpses:on_void_overworld run particle minecraft:end_rod ~ ~ ~ 0.2 0.1 0.2 0 4
execute as @e[type=minecraft:mannequin,tag=player_corpses.corpse,predicate=player_corpses:in_minecart] at @s run function player_corpses:dismount

execute unless score Config can_be_looted_from_right_clicking matches 1 as @e[type=minecraft:interaction,tag=player_corpses.interaction] run function player_corpses:config/can_be_looted_by_right_clicking/right_clickable_remove 
execute if score Config can_be_looted_from_right_clicking matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.kept,tag=player_corpses.right_clickable] on passengers run function player_corpses:config/can_be_looted_by_right_clicking/right_clickable_remove 

execute unless score Config despawn_timer matches 1.. if entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.timed] run function player_corpses:config/despawn_timer/despawn_remove

execute unless score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s run function player_corpses:config/no_name_description/fix_unnamed
execute unless score Config has_description matches 1 if score Config has_player_name matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s run function player_corpses:config/no_name_description/fix_undescriptive


execute if score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.unnamed] run function player_corpses:config/no_name_description/fix_texts
execute if score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.undescriptive] run function player_corpses:config/no_name_description/fix_texts

execute unless score Config has_player_name matches 1 unless score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.unnamed] run function player_corpses:config/no_name_description/fix_all
execute unless score Config has_player_name matches 1 unless score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.undescriptive] run function player_corpses:config/no_name_description/fix_all

execute as @e[type=mannequin,tag=player_corpses.corpse,tag=!player_corpses.26] run function player_corpses:corpse_update
