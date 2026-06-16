summon item ~ ~0.2 ~ {Invisible:1b,Tags:["player_corpses.offhand"],PickupDelay:20,Item:{id:"minecraft:stone_button",count:1}}
item replace entity @n[type=item,tag=player_corpses.offhand] hotbar.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
