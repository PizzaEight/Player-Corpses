#dynamically put the items in the player's inventory by copying them to a newly summoned item

#transfer inventory
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] if entity @s[tag=player_corpses.no_loot_sorting] run return fail
execute at @s run summon item ~ ~ ~ {Invisible:1b,Tags:["player_corpses.filler"],PickupDelay:32767,Item:{id:"minecraft:stone_button",count:1}}

#For performance

tag @s add player_corpses.searching_too
#Only transfer the hotbar if the player had anything there
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] unless entity @s[tag=player_corpses.hotbar_poor] as @a[tag=player_corpses.searching_too] run function player_corpses:give_items/replace_items_hotbar

#Only transfer the inventory if the player had anything there
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] unless entity @s[tag=player_corpses.inventory_poor] as @a[tag=player_corpses.searching_too] run function player_corpses:give_items/replace_items_inventory

#Only transfer the armor if the player had anything there
execute as @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] unless entity @s[tag=player_corpses.armor_poor] as @a[tag=player_corpses.searching_too] run function player_corpses:give_items/replace_items_armor
tag @s remove player_corpses.searching_too

data modify entity @n[type=item,tag=player_corpses.filler] Item set from entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[18].item
execute unless items entity @s weapon.offhand * run data modify entity @n[type=minecraft:mannequin,tag=player_corpses.corpse,tag=player_corpses.searching] equipment.head.components.minecraft:container[1].item.components.minecraft:container[18].item.components.minecraft:custom_data set value {player_corpses:item}
execute unless items entity @s weapon.offhand * run item replace entity @s weapon.offhand from entity @n[type=item,tag=player_corpses.filler] hotbar.0

execute as @n[type=item,tag=player_corpses.filler] run kill @s
clear @a *[custom_data={player_corpses:item}]
execute as @e[tag=!player_corpses.bone,nbt={Item:{components:{"minecraft:custom_data":{player_corpses:item}}}}] run damage @s 20