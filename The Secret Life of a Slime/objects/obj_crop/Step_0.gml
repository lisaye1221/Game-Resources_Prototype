/// @description Insert description here
// You can write your code in this editor

if(crop_growth_remaining > 0){
	crop_growth_remaining -= (1/room_speed);
	image_index = floor((crop_growth_time - crop_growth_remaining) / interval);
}
else{
	image_index = image_number - 1;
	harvestable = true;
}