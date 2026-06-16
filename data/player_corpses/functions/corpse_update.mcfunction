execute as @s[tag=!player_corpses.26] on passengers run execute on passengers run execute on passengers run kill @s
execute as @s[tag=!player_corpses.26] on passengers run execute on passengers run kill @s
execute as @s[tag=!player_corpses.26] on passengers run kill @s[tag=!player_corpses.timed]
kill @e[type=text_display,tag=player_corpses.2]
tag @s[tag=!player_corpses.26] remove player_corpses.unnamed
tag @s[tag=!player_corpses.26] remove player_corpses.undescriptive
tag @s[tag=!player_corpses.26] remove player_corpses.right_clickable
team join player_corpses.corpse_friend @s
tag @s add player_corpses.no_loot_sorting
tag @e[type=mannequin,tag=player_corpses.corpse] remove player_corpses.26
scoreboard players set @s player_corpses.corpse_version 30