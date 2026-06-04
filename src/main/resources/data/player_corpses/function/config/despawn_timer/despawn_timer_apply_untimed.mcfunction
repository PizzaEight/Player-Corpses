execute at @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.timed] run summon minecraft:text_display ~ ~ ~ {view_range:0.198f,width:0.1f,height:0.1f,Tags:["player_corpses.corpse","player_corpses.1","player_corpses.killable"],billboard:"center"}
execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=!player_corpses.timed,tag=player_corpses.1] run scoreboard players operation @s despawn_timer = Config despawn_timer
execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=!player_corpses.timed,tag=player_corpses.1] run scoreboard players set @s despawn_timer_seconds 59
execute as @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=!player_corpses.timed,tag=player_corpses.1] run scoreboard players remove @s despawn_timer 1

execute as @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.timed] at @s run ride @n[type=minecraft:text_display,tag=player_corpses.corpse,tag=!player_corpses.timed,tag=player_corpses.1] mount @s

tag @e[type=minecraft:text_display,tag=player_corpses.corpse,tag=!player_corpses.timed,tag=player_corpses.1] add player_corpses.timed
tag @e[type=minecraft:mannequin,tag=player_corpses.corpse,tag=!player_corpses.timed] add player_corpses.timed