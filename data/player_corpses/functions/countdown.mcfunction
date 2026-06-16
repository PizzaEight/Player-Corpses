schedule function player_corpses:countdown 1s
execute if entity @e[type=minecraft:mannequin,tag=player_corpses.corpse] run function player_corpses:countdown_corpse
#Predicate compatability for 26.1 and 26.2
execute if score Config stays_after_being_looted matches 1 if score Config player_corpses.game_version matches ..261 run function player_corpses:version_support/countdown/26.1
execute if score Config stays_after_being_looted matches 1 if score Config player_corpses.game_version matches 262.. run function player_corpses:version_support/countdown/26.2
execute unless score Config has_player_name matches 1 if entity @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=player_corpses.named_zombie] run function player_corpses:config/can_get_zombified/remove_name
execute if score Config has_player_name matches 1 if entity @e[type=minecraft:armor_stand,tag=player_corpses.corpse,tag=player_corpses.unnamed_zombie] run function player_corpses:config/can_get_zombified/add_name