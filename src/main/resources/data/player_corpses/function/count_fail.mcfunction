tellraw @s [{"color":"red","text":"The config option for corpse looting only by their owner is enabled, you are NOT the owner of this one!"}]
playsound minecraft:block.note_block.didgeridoo player @s ~ ~ ~ 1 0
execute unless score Config can_be_looted_from_right_clicking matches 1 run tag @s add player_corpses.msg_cooldown