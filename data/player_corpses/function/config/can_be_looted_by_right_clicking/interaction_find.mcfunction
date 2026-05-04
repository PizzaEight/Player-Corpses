scoreboard players set #interaction player_corpses.interaction 0
execute on target store result score #interaction player_corpses.interaction if entity @s[tag=player_corpses.search]
execute if score #interaction player_corpses.interaction matches 1 on vehicle run tag @s add player_corpses.searching
execute if score #interaction player_corpses.interaction matches 1 on target run scoreboard players set @s player_corpses.score 0
execute if score #interaction player_corpses.interaction matches 1 if score Config can_only_be_looted_by_owner matches 1 on target run function player_corpses:config/can_be_looted_by_right_clicking/interaction_target
execute if score #interaction player_corpses.interaction matches 1 unless score Config can_only_be_looted_by_owner matches 1 on target run function player_corpses:get_items 
execute if score #interaction player_corpses.interaction matches 1 if score Config stays_after_being_looted matches 1 run function player_corpses:config/can_be_looted_by_right_clicking/right_clickable_remove
tag @e[type=minecraft:mannequin,tag=player_corpses.corpse] remove player_corpses.searching
execute if score #interaction player_corpses.interaction matches 1 unless score Config can_only_be_looted_by_owner matches 1 unless score Config has_gore matches 1 on target run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 1
execute if score #interaction player_corpses.interaction matches 1 unless score Config stays_after_being_looted matches 1 unless score Config can_only_be_looted_by_owner matches 1 on vehicle run tp ~ -10000 ~
execute if score #interaction player_corpses.interaction matches 1 run data remove entity @s interaction