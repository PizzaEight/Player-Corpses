data modify entity @s hide_description set value 0b
data modify entity @s CustomNameVisible set value 1b
data merge entity @s {description:[{"color":"red","text":"Looted"}]}
data remove entity @s[tag=!player_corpses.poor] equipment.mainhand.components.minecraft:container
data remove entity @s[tag=!player_corpses.poor] equipment.offhand.components.minecraft:container
data modify entity @s equipment.mainhand.id set from entity @s equipment.mainhand.components.minecraft:item_model
data modify entity @s equipment.offhand.id set from entity @s equipment.offhand.components.minecraft:item_model
effect clear @s minecraft:resistance
data merge entity @s {Health:0.1}
item replace entity @s armor.head with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"head",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
item replace entity @s armor.chest with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"chest",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
item replace entity @s armor.legs with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"legs",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
item replace entity @s armor.feet with poisonous_potato[!consumable,custom_data={player_corpses:item},equippable={slot:"feet",equip_sound:"intentionally_empty",asset_id:"air",dispensable:false,equip_on_interact:false,swappable:false,damage_on_hurt:false,can_be_sheared:false,shearing_sound:"intentionally_empty"},item_model="air",tooltip_display={hide_tooltip:true}]
item replace entity @s weapon.mainhand with air
item replace entity @s weapon.offhand with air
title @a[distance=0..2] actionbar {"color":"yellow","text":"Punch the looted corpse once to get rid of it"}
tag @s add player_corpses.kept
scoreboard players set @s player_corpses.kept 1