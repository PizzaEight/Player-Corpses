execute unless entity @s[predicate=player_corpses:version_number] if score Config load matches 1 run tellraw @s {"bold":true,"color":"dark_green","text":"Player Corpses successfully updated to version 3.0"}
scoreboard players set @s player_corpses.version 30

team add player_corpses.corpse_friend
team modify player_corpses.corpse_friend friendlyFire false
scoreboard objectives add load dummy
scoreboard objectives add player_corpses.died deathCount
scoreboard objectives add player_corpses.score dummy
scoreboard objectives add player_corpses.x dummy
scoreboard objectives add player_corpses.y dummy
scoreboard objectives add player_corpses.z dummy
scoreboard objectives add player_corpses.xp_levels dummy
scoreboard objectives add player_corpses.xp_points dummy
scoreboard objectives add player_corpses.uuid dummy
scoreboard objectives add player_corpses.uuid2 dummy
scoreboard objectives add player_corpses.uuid3 dummy
scoreboard objectives add player_corpses.uuid4 dummy
scoreboard objectives add player_corpses.config_show dummy
scoreboard objectives add despawn_timer dummy
scoreboard objectives add despawn_timer_seconds dummy
scoreboard objectives add has_gore dummy
scoreboard objectives add can_get_zombified dummy
scoreboard objectives add gives_death_coords dummy
scoreboard objectives add sort_loot_from_corpses dummy
scoreboard objectives add can_only_be_looted_by_owner dummy
scoreboard objectives add can_be_looted_from_right_clicking dummy
scoreboard objectives add instant_looting dummy
scoreboard objectives add stays_after_being_looted dummy
scoreboard objectives add has_player_name dummy
scoreboard objectives add has_description dummy
scoreboard objectives add gives_player_head dummy
scoreboard objectives add floats_in_water dummy
scoreboard objectives add floats_in_lava dummy
scoreboard objectives add burns_in_lava dummy
scoreboard objectives add remove_config dummy
scoreboard objectives add player_corpses.interaction dummy
scoreboard objectives add player_corpses.kept dummy
scoreboard objectives add player_corpses.10 dummy
scoreboard objectives add player_corpses.dimention dummy
scoreboard objectives add saves_items_from_void dummy
scoreboard objectives add remove_corpse_finder dummy
scoreboard objectives add -63 dummy
scoreboard objectives add player_corpses.time dummy
scoreboard objectives add player_corpses.spawn_time dummy
scoreboard objectives add player_corpses.corpse_version dummy
scoreboard objectives add player_corpses.game_version dummy
scoreboard objectives add player_corpses.percent dummy
scoreboard players set Config -63 -63
scoreboard players set Config player_corpses.10 10
scoreboard players set Config player_corpses.time 1
scoreboard objectives add config trigger 
scoreboard objectives add corpse_finder trigger 

execute unless score Config gives_death_coords matches 0..1 run scoreboard players set Config gives_death_coords 1
execute unless score Config has_player_name matches 0..1 run scoreboard players set Config has_player_name 1
execute unless score Config has_description matches 0..1 run scoreboard players set Config has_description 1
execute unless score Config despawn_timer matches 0.. run scoreboard players set Config despawn_timer 0
execute unless score Config has_gore matches 0..1 run scoreboard players set Config has_gore 0
execute unless score Config can_get_zombified matches 0..1 run scoreboard players set Config can_get_zombified 0
execute unless score Config sort_loot_from_corpses matches 0..1 run scoreboard players set Config sort_loot_from_corpses 1
execute unless score Config can_only_be_looted_by_owner matches 0..1 run scoreboard players set Config can_only_be_looted_by_owner 0
execute unless score Config can_be_looted_from_right_clicking matches 0..1 run scoreboard players set Config can_be_looted_from_right_clicking 0
execute unless score Config instant_looting matches 0..1 run scoreboard players set Config instant_looting 0
execute unless score Config stays_after_being_looted matches 0..1 run scoreboard players set Config stays_after_being_looted 0
execute unless score Config gives_player_head matches 0..1 run scoreboard players set Config gives_player_head 0
execute unless score Config floats_in_water matches 0..1 run scoreboard players set Config floats_in_water 1
execute unless score Config floats_in_lava matches 0..1 run scoreboard players set Config floats_in_lava 1
execute unless score Config burns_in_lava matches 0..1 run scoreboard players set Config burns_in_lava 0
execute unless score Config saves_items_from_void matches 0..1 run scoreboard players set Config saves_items_from_void 1
execute unless score Config remove_corpse_finder matches 0..1 run scoreboard players set Config remove_corpse_finder 0
execute unless score Config remove_config matches 0..1 run scoreboard players set Config remove_config 0

execute as @a unless score Config load matches 1 run function player_corpses:config/show_first_time

scoreboard players set Config load 0
scoreboard players set Config load 1

scoreboard players set @a config 0
scoreboard players set @a corpse_finder 0
scoreboard players enable @a config
scoreboard players enable @a corpse_finder