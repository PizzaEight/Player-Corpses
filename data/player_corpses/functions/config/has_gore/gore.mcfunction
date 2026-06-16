execute unless score Config has_gore matches 1.. run return fail
execute if score Config has_gore matches 1.. run schedule function player_corpses:config/has_gore/gore 1
execute if score Config has_gore matches 1.. unless entity @e[type=item,tag=player_corpses.bone] run return fail

execute at @e[type=item,tag=player_corpses.blood,nbt=!{OnGround:1b}] run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~ ~ 0 0 0 1 0 normal
execute at @e[type=item,tag=player_corpses.ash] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 0 normal
execute at @e[type=item,tag=player_corpses.blood,nbt=!{OnGround:0b}] run particle dust{color:[1.000,0.000,0.000],scale:2} ~ ~0.1 ~ 0.3 0.1 0.3 1 1 normal
execute at @e[type=item,tag=player_corpses.ash,nbt=!{OnGround:0b}] run particle minecraft:smoke ~ ~0.1 ~ 0.3 0.1 0.3 0 5 normal
