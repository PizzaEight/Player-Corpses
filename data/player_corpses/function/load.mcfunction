scoreboard objectives add player_corpses.version dummy
execute as @a[predicate=!player_corpses:version_number] run function player_corpses:update_version
function player_corpses:config/config_reload
schedule function player_corpses:corpse_finder/timer 60s
gamerule keep_inventory true