$tp @s $(x) $(y) $(z)
$playsound minecraft:entity.enderman.teleport player @s $(x) $(y) $(z)
execute as @s at @s unless score Config saves_items_from_void matches 1 if predicate player_corpses:in_void unless predicate player_corpses:in_overworld run tp @s ~ 1 ~
execute as @s at @s unless score Config saves_items_from_void matches 1 if predicate player_corpses:in_void_overworld if predicate player_corpses:in_overworld run tp @s ~ -63 ~
