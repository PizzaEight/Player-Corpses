tag @s remove player_corpses.unnamed
execute as @s run data modify entity @s CustomName set from entity @s profile.name
execute as @s run data modify entity @s CustomNameVisible set value 1b
execute if entity @s[tag=player_corpses.undescriptive] run return fail
execute as @s[tag=!player_corpses.kept] at @s run function player_corpses:config/no_name_description/remove_description