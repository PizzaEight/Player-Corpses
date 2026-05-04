execute if entity @s[tag=player_corpses.undescriptive,tag=player_corpses.unnamed] run return fail
execute as @s[tag=!player_corpses.kept] run data modify entity @s hide_description set value 1b
tag @s add player_corpses.undescriptive
execute as @s run data modify entity @s CustomName set value ""
execute as @s[tag=!player_corpses.kept] run data modify entity @s CustomNameVisible set value 0b
tag @s add player_corpses.unnamed
