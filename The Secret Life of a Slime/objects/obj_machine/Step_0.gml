/// @description Insert description here
// You can write your code in this editor

if (status == "busy"){
	time_left -= 1/room_speed;
	
	if (time_left <= 0){
		time_left = time_to_convert;
		status = "full";
	}
}

// activating full signal
if (status == "full" && !full_signal){
	instance_activate_object(obj_exclamation);
	full_signal = true;
} else if (status != "full" && full_signal){
	instance_deactivate_object(obj_exclamation);
	full_signal = false;
}
