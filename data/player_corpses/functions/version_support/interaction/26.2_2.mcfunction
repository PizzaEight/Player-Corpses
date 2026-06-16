tag @s add player_corpses.search
execute as @e[type=interaction,tag=player_corpses.interaction,distance=0..6,tag=!player_corpses.kept] run function player_corpses:config/can_be_looted_by_right_clicking/interaction_find
tag @s remove player_corpses.search