/// @description Insert description here
// You can write your code in this editor

if(!has_berries){
	growing = true;
	berry_time_remaining = irandom_range(MIN_GROWTH_TIME, MAX_GROWTH_TIME);
}
if(berry_time_remaining > 0 && growing) {
	berry_time_remaining -= 1/room_speed;	
}
if(growing && berry_time_remaining <= 0){
	has_berries = true;
	growing = false;
}
sprite_index = has_berries ? spr_bush_full : spr_bush_empty;