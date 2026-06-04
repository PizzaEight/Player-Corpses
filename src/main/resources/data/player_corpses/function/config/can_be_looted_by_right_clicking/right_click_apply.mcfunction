execute unless score Config can_be_looted_from_right_clicking matches 1 run return fail
execute if score Config can_be_looted_from_right_clicking matches 1 run schedule function player_corpses:config/can_be_looted_by_right_clicking/right_click_apply 1s 
execute if score Config can_be_looted_from_right_clicking matches 1 unless entity @e[type=mannequin,tag=player_corpses.corpse,tag=!player_corpses.kept] run return fail

execute as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.right_clickable,tag=!player_corpses.kept] run function player_corpses:config/can_be_looted_by_right_clicking/right_click_load

execute as @e[type=interaction,tag=player_corpses.interaction] at @s if entity @a[distance=0..14] run particle minecraft:happy_villager ~ ~ ~ 0.15 0.10 0.15 0 2