scoreboard players set Config player_corpses.dimention 0
execute if dimension minecraft:overworld run scoreboard players set Config player_corpses.dimention 1
execute if dimension minecraft:the_nether run scoreboard players set Config player_corpses.dimention 2
execute if dimension minecraft:the_end run scoreboard players set Config player_corpses.dimention 3

execute if entity @a[gamemode=!creative,gamemode=!spectator] if entity @s[type=mannequin,tag=player_corpses.corpse,tag=!player_corpses.kept] run function player_corpses:corpse_finder/print_coords_survival
execute if entity @a[gamemode=!creative,gamemode=!spectator] if entity @s[type=armor_stand,tag=player_corpses.corpse] run function player_corpses:corpse_finder/print_coords_survival_zombie
execute if entity @a[gamemode=!creative,gamemode=!spectator] if entity @s[type=mannequin,tag=player_corpses.corpse,tag=player_corpses.kept] run function player_corpses:corpse_finder/print_coords_survival_looted
execute if entity @a[gamemode=!survival,gamemode=!adventure] if entity @s[type=mannequin,tag=player_corpses.corpse,tag=!player_corpses.kept] run function player_corpses:corpse_finder/print_coords_creative with storage player_corpses:corpse_coordinates
execute if entity @a[gamemode=!survival,gamemode=!adventure] if entity @s[type=armor_stand,tag=player_corpses.corpse] run function player_corpses:corpse_finder/print_coords_creative_zombie with storage player_corpses:corpse_coordinates
execute if entity @a[gamemode=!survival,gamemode=!adventure] if entity @s[type=mannequin,tag=player_corpses.corpse,tag=player_corpses.kept] run function player_corpses:corpse_finder/print_coords_creative_looted with storage player_corpses:corpse_coordinates
execute if entity @a run function player_corpses:corpse_finder/print_coords_other