/// @description Insert description here
// You can write your code in this editor

// records how many seconds passed by
global.time += 1/room_speed;
// 60 seconds = 1 day
global.days = floor(global.time / 60);
// lose 0.1 energy per second
global.energy -= ((0.1/room_speed) * ENERGY_DEPLETION_MULTIPLIER);

if global.dead {
	if (keyboard_check_pressed(ord("R"))) {
		game_restart();
	}
}

if(is_room_transition){
	length = array_length(home_instances_to_run_in_bg)
	if(room == home){
		
		for(var i = 0; i < length; i++){
			home_instances_to_run_in_bg[i].visible = true;
			home_instances_to_run_in_bg[i].interactable = true;
		}
	}
	else if(room == town){
		instance_deactivate_object(obj_bush_solid);
		for(var i = 0; i < length; i++){
			home_instances_to_run_in_bg[i].visible = false;	
			home_instances_to_run_in_bg[i].interactable = false;
		}
	}
	is_room_transition = false;
}