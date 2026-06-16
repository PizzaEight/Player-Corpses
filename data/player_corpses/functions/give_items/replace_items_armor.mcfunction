data modify entity @n[type=item,tag=player_corpses.filler] Item set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[14].item
execute unless items entity @s armor.head * run data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[14].item.components.minecraft:custom_data set value {player_corpses:item}
execute unless items entity @s armor.head * run item replace entity @s armor.head from entity @n[type=item,tag=player_corpses.filler] hotbar.0

data modify entity @n[type=item,tag=player_corpses.filler] Item set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[15].item
execute unless items entity @s armor.chest * run data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[15].item.components.minecraft:custom_data set value {player_corpses:item}
execute unless items entity @s armor.chest * run item replace entity @s armor.chest from entity @n[type=item,tag=player_corpses.filler] hotbar.0

data modify entity @n[type=item,tag=player_corpses.filler] Item set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[16].item
execute unless items entity @s armor.legs * run data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[16].item.components.minecraft:custom_data set value {player_corpses:item}
execute unless items entity @s armor.legs * run item replace entity @s armor.legs from entity @n[type=item,tag=player_corpses.filler] hotbar.0

data modify entity @n[type=item,tag=player_corpses.filler] Item set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[17].item
execute unless items entity @s armor.feet * run data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[17].item.components.minecraft:custom_data set value {player_corpses:item}
execute unless items entity @s armor.feet * run item replace entity @s armor.feet from entity @n[type=item,tag=player_corpses.filler] hotbar.0
