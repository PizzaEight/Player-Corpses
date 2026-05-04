execute on vehicle if entity @s[tag=!player_corpses.kept] run data merge entity @s {description:{"color":aqua,"text":"Sneak here to get your items back"}}
execute on vehicle run tag @s remove player_corpses.right_clickable
tp @s ~ -1000 ~