scoreboard objectives add player_corpses.version dummy
execute as @a[predicate=!player_corpses:version_number] run function player_corpses:update_version
function player_corpses:config/config_reload
schedule function player_corpses:corpse_finder/timer 60s
#Predicate compatability for 26.1 and 26.2
execute if score Config player_corpses.game_version matches ..210 run function player_corpses:version_support/load/1.21.10
execute if score Config player_corpses.game_version matches 211.. run function player_corpses:version_support/load/1.21.11
advancement revoke @a[limit=1] only player_corpses:get_version