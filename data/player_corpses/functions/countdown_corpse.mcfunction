execute at @e[type=minecraft:mannequin,tag=player_corpses.corpse] run team join player_corpses.corpse_friend @e[distance=0..16,type=minecraft:warden,team=!player_corpses.corpse_friend]

#Predicate compatability for 26.1 and 26.2
execute if score Config player_corpses.game_version matches ..261 run function player_corpses:version_support/countdown_corpse/26.1
execute if score Config player_corpses.game_version matches 262.. run function player_corpses:version_support/countdown_corpse/26.2

execute unless predicate player_corpses:in_overworld if score Config saves_items_from_void matches 1 at @a[gamemode=!spectator] as @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..11,nbt={OnGround:0b}] at @s if predicate player_corpses:on_void run particle minecraft:end_rod ~ ~ ~ 0.2 0.1 0.2 0 4
execute if predicate player_corpses:in_overworld if score Config saves_items_from_void matches 1 at @a[gamemode=!spectator] as @e[type=minecraft:mannequin,tag=player_corpses.corpse,distance=0..11,nbt={OnGround:0b}] at @s if predicate player_corpses:on_void_overworld run particle minecraft:end_rod ~ ~ ~ 0.2 0.1 0.2 0 4

execute unless score Config can_be_looted_from_right_clicking matches 1 as @e[type=minecraft:interaction,tag=player_corpses.interaction] run function player_corpses:config/can_be_looted_by_right_clicking/right_clickable_remove 

execute unless score Config despawn_timer matches 1.. if entity @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.timed] run function player_corpses:config/despawn_timer/despawn_remove

execute unless score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s run function player_corpses:config/no_name_description/fix_unnamed
execute unless score Config has_description matches 1 if score Config has_player_name matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse] at @s run function player_corpses:config/no_name_description/fix_undescriptive


execute if score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.unnamed] run function player_corpses:config/no_name_description/fix_texts
execute if score Config has_player_name matches 1 if score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.undescriptive] run function player_corpses:config/no_name_description/fix_texts

execute unless score Config has_player_name matches 1 unless score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.unnamed] run function player_corpses:config/no_name_description/fix_all
execute unless score Config has_player_name matches 1 unless score Config has_description matches 1 as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.undescriptive] run function player_corpses:config/no_name_description/fix_all

execute as @e[type=mannequin,tag=player_corpses.corpse,tag=player_corpses.offhandless] at @s if items entity @s weapon.offhand * run function player_corpses:config/stays_after_being_looted/drop_offhand

execute as @e[type=mannequin,tag=player_corpses.corpse] unless score @s player_corpses.corpse_version matches 30.. run function player_corpses:corpse_update
