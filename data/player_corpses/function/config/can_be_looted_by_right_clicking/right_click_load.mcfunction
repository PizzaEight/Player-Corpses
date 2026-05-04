execute at @s run summon interaction ~ ~ ~ {width:0.5f,height:0.5f,response:1b,Tags:["player_corpses.interaction","player_corpses.right_clickable"]}
execute as @s at @s run ride @n[type=interaction,tag=player_corpses.interaction] mount @s
execute as @s run data merge entity @s {description:{"color":aqua,"text":"Right Click here to get your items back"}}

tag @s add player_corpses.right_clickable