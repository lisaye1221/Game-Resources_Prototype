/// @description Insert description here
// You can write your code in this editor

if (status == "busy"){
	time_left -= 1/room_speed;
	
	if (time_left <= 0){
		time_left = time_to_convert;
		status = "full";
	}
}
