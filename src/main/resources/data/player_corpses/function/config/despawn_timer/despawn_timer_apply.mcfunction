execute unless score Config despawn_timer matches 1.. run return fail
execute if score Config despawn_timer matches 1.. run schedule function player_corpses:config/despawn_timer/despawn_timer_apply 1s 
execute if score Config despawn_timer matches 1.. unless entity @e[type=mannequin,tag=player_corpses.corpse] run return fail

execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=player_corpses.1,tag=!player_corpses.uncounting] on vehicle unless entity @s[tag=player_corpses.kept] on passengers as @s[tag=player_corpses.1] at @s unless entity @a[tag=player_corpses.correct,predicate=player_corpses:shift_key,distance=0..2] run scoreboard players remove @s despawn_timer_seconds 1
execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=player_corpses.1,tag=!player_corpses.uncounting] on vehicle if entity @s[tag=player_corpses.kept] on passengers as @s[tag=player_corpses.1] at @s run scoreboard players remove @s despawn_timer_seconds 1
execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=player_corpses.1,scores={despawn_timer_seconds=0}] if score @s despawn_timer matches ..0 run tag @s add player_corpses.uncounting

execute if entity @e[type=minecraft:text_display,tag=player_corpses.corpse,scores={despawn_timer_seconds=..0}] run function player_corpses:config/despawn_timer/despawn_timer_apply_0_sec
execute if entity @e[type=minecraft:mannequin,tag=!player_corpses.timed,tag=player_corpses.corpse] run function player_corpses:config/despawn_timer/despawn_timer_apply_untimed
function player_corpses:config/despawn_timer/despawn_timer_apply_normal
tag @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=player_corpses.timed,tag=player_corpses.2] add player_corpses.timed
