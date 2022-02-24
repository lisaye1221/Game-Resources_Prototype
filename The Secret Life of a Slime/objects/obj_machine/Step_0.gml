/// @description Insert description here
// You can write your code in this editor

solid = interactable;

if (status == "busy"){
	time_left -= 1/room_speed;
	
	if (time_left <= 0){
		audio_play_sound(sfx_machine_finish, 1, 0);
		time_left = time_to_convert;
		status = "full";
	}
}
else if (status == "repairing"){
	
	time_left -= 1/room_speed;
	
	if (time_left <= 0){
		time_left = time_to_convert;
		status = "empty";
	}
}



// activating full signal
if (status == "full" && !full_signal && interactable){
	obj_exclamation.visible = true;
	full_signal = true;
} else if (status != "full" && full_signal){
	obj_exclamation.visible = false;
	full_signal = false;
}

// fixing
if (status == "broken" || status == "repairing") {
	
	sprite_index = spr_machine_broken;
	
}
else{
	sprite_index = spr_machine;
}