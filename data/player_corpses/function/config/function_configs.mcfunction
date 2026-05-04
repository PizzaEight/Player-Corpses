execute as @a[scores={config=1016}] unless score Config remove_config matches 1 unless entity @s[gamemode=creative] run tellraw @s [{"color":"yellow","text":"Remove Config was set to: "},{"color":"dark_green","text":"True"}]

execute as @a[scores={config=999}] run scoreboard players add Config despawn_timer 1
execute as @a[scores={config=1000}] unless score Config despawn_timer matches ..0 run scoreboard players remove Config despawn_timer 1
execute as @a[scores={config=1001}] run scoreboard players set Config has_gore 1
execute as @a[scores={config=1002}] run scoreboard players set Config can_get_zombified 1
execute as @a[scores={config=1003}] run scoreboard players set Config gives_death_coords 1
execute as @a[scores={config=1004}] run scoreboard players set Config can_only_be_looted_by_owner 1
execute as @a[scores={config=1005}] run scoreboard players set Config can_be_looted_from_right_clicking 1
execute as @a[scores={config=1006}] run scoreboard players set Config instant_looting 1
execute as @a[scores={config=1007}] run scoreboard players set Config stays_after_being_looted 1
execute as @a[scores={config=1010}] run scoreboard players set Config has_player_name 1
execute as @a[scores={config=1011}] run scoreboard players set Config has_description 1
execute as @a[scores={config=1012}] run scoreboard players set Config gives_player_head 1
execute as @a[scores={config=1013}] run scoreboard players set Config floats_in_water 1
execute as @a[scores={config=1014}] run scoreboard players set Config floats_in_lava 1
execute as @a[scores={config=1015}] run scoreboard players set Config burns_in_lava 1
execute as @a[scores={config=1017}] run scoreboard players set Config saves_items_from_void 1
execute as @a[scores={config=1018}] run scoreboard players set Config remove_corpse_finder 1
execute as @a[scores={config=1016}] run scoreboard players set Config remove_config 1
execute as @a[scores={config=11000}] run scoreboard players set Config despawn_timer 0
execute as @a[scores={config=11001}] run scoreboard players set Config has_gore 0
execute as @a[scores={config=11002}] run scoreboard players set Config can_get_zombified 0
execute as @a[scores={config=11002}] run tag @a remove player_corpses.zombie
execute as @a[scores={config=11002}] run tag @a remove player_corpses.drowned
execute as @a[scores={config=11002}] run tag @a remove player_corpses.husk
execute as @a[scores={config=11003}] run scoreboard players set Config gives_death_coords 0
execute as @a[scores={config=11004}] run scoreboard players set Config can_only_be_looted_by_owner 0
execute as @a[scores={config=11005}] run scoreboard players set Config can_be_looted_from_right_clicking 0
execute as @a[scores={config=11006}] run scoreboard players set Config instant_looting 0
execute as @a[scores={config=11007}] run scoreboard players set Config stays_after_being_looted 0
execute as @a[scores={config=11010}] run scoreboard players set Config has_player_name 0
execute as @a[scores={config=11011}] run scoreboard players set Config has_description 0
execute as @a[scores={config=11012}] run scoreboard players set Config gives_player_head 0
execute as @a[scores={config=11013}] run scoreboard players set Config floats_in_water 0
execute as @a[scores={config=11014}] run scoreboard players set Config floats_in_lava 0
execute as @a[scores={config=11015}] run scoreboard players set Config burns_in_lava 0
execute as @a[scores={config=11017}] run scoreboard players set Config saves_items_from_void 0
execute as @a[scores={config=11018}] run scoreboard players set Config remove_corpse_finder 0
execute as @a[scores={config=11016}] run scoreboard players set Config remove_config 0

execute as @a[scores={config=999..1000}] run function player_corpses:config/despawn_timer/despawn_timer

execute as @a[scores={config=..21999}] run function player_corpses:config/config_reload

execute as @a[scores={config=1001}] run tellraw @s [{"color":"yellow","text":"Has Gore was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1002}] run tellraw @s [{"color":"yellow","text":"Can Get Zombified set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1003}] run tellraw @s [{"color":"yellow","text":"Gives Death Coords was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1004}] run tellraw @s [{"color":"yellow","text":"Can Only Be Looted By Owner was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1005}] run tellraw @s [{"color":"yellow","text":"Can Be Looted From Right Clicking set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1006}] run tellraw @s [{"color":"yellow","text":"Instant Looting was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1007}] run tellraw @s [{"color":"yellow","text":"Stays After Being Looted was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1010}] run tellraw @s [{"color":"yellow","text":"Has Player's Name was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1011}] run tellraw @s [{"color":"yellow","text":"Has Description was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1012}] run tellraw @s [{"color":"yellow","text":"Gives Player's Head was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1013}] run tellraw @s [{"color":"yellow","text":"Floats in Water was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1014}] run tellraw @s [{"color":"yellow","text":"Floats in Lava was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1015}] run tellraw @s [{"color":"yellow","text":"Can Burn was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1017}] run tellraw @s [{"color":"yellow","text":"Saves Items From Void was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1018}] run tellraw @s [{"color":"yellow","text":"Remove Corpse Finder Access was set to: "},{"color":"dark_green","text":"True"}]
execute as @a[scores={config=1016}] run tellraw @s [{"color":"yellow","text":"Remove Config Access was set to: "},{"color":"dark_green","text":"True"}]

execute as @s[scores={config=999}] run tellraw @s [{"color":"yellow","text":"Despawn Timer was set to: "},{"color":"aqua","score":{"name":"Config","objective":"despawn_timer"}},{"color":"aqua","text":" Minute(s)"}]
execute as @s[scores={config=1000}] if score Config despawn_timer matches 0 run tellraw @s [{"color":"yellow","text":"Despawn Timer was set to: "},{"color":"dark_red","text":"Never"}]
execute as @s[scores={config=1000}] unless score Config despawn_timer matches 0 run tellraw @s [{"color":"yellow","text":"Despawn Timer was set to: "},{"color":"aqua","score":{"name":"Config","objective":"despawn_timer"}},{"color":"aqua","text":" Minute(s)"}]
execute as @s[scores={config=11000}] if score Config despawn_timer matches 0 run tellraw @s [{"color":"yellow","text":"Despawn Timer was set to: "},{"color":"dark_red","text":"Never"}]

execute as @a[scores={config=11001}] run tellraw @s [{"color":"yellow","text":"Has Gore was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11002}] run tellraw @s [{"color":"yellow","text":"Can Get Zombified was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11003}] run tellraw @s [{"color":"yellow","text":"Gives Death Coords was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11004}] run tellraw @s [{"color":"yellow","text":"Can Only Be Looted By Owner was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11005}] run tellraw @s [{"color":"yellow","text":"Can Be Looted From Right Clicking was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11006}] run tellraw @s [{"color":"yellow","text":"Instant Looting was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11007}] run tellraw @s [{"color":"yellow","text":"Stays After Being Looted was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11010}] run tellraw @s [{"color":"yellow","text":"Has Player's Name was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11011}] run tellraw @s [{"color":"yellow","text":"Has Description was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11012}] run tellraw @s [{"color":"yellow","text":"Gives Player's Head was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11013}] run tellraw @s [{"color":"yellow","text":"Floats in Water was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11014}] run tellraw @s [{"color":"yellow","text":"Floats in Lava was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11015}] run tellraw @s [{"color":"yellow","text":"Can Burn was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11017}] run tellraw @s [{"color":"yellow","text":"Saves Items From Void was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11018}] run tellraw @s [{"color":"yellow","text":"Remove Corpse Finder Access was set to: "},{"color":"dark_red","text":"False"}]
execute as @a[scores={config=11016}] run tellraw @s [{"color":"yellow","text":"Remove Config was set to: "},{"color":"dark_red","text":"False"}]

execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,scores={despawn_timer_seconds=..58}] run scoreboard players add @s despawn_timer_seconds 1