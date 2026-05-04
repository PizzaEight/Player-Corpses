execute if score Config despawn_timer matches 1.. run function player_corpses:config/despawn_timer/despawn_timer_apply
execute if score Config can_be_looted_from_right_clicking matches 1 run function player_corpses:config/can_be_looted_by_right_clicking/right_click_apply
execute if score Config burns_in_lava matches 1 run function player_corpses:config/burns_in_lava/burns_in_lava
execute if score Config floats_in_lava matches 1 run function player_corpses:config/floats_in_lava/floats_in_lava
execute if score Config floats_in_water matches 1 run function player_corpses:config/floats_in_water/floats_in_water
execute if score Config saves_items_from_void matches 1 run function player_corpses:config/saves_items_from_void/saves_items_from_void
execute if score Config has_gore matches 1 run function player_corpses:config/has_gore/gore
function player_corpses:countdown
function player_corpses:config/show