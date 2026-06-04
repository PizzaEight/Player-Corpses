tag @s remove player_corpses.undescriptive
execute as @s run data modify entity @s hide_description set value 0b
execute as @s run data modify entity @s CustomNameVisible set value 1b
execute unless score Config can_be_looted_from_right_clicking matches 1 as @s[tag=!player_corpses.kept] run data merge entity @s {description:{"color":aqua,"text":"Sneak here to get your items back"}}
execute if score Config can_be_looted_from_right_clicking matches 1 as @s[tag=!player_corpses.kept] run data merge entity @s {description:{"color":aqua,"text":"Right Click here to get your items back"}}
execute if entity @s[tag=player_corpses.unnamed] run return fail
execute as @s run function player_corpses:config/no_name_description/remove_name