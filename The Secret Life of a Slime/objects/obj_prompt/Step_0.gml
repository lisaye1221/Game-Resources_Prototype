/// @description Insert description here
// You can write your code in this editor

player = instance_place(x,y,obj_player)
if(player != noone){
	is_show_prompt = true;
	player_x = player.x
	player_y = player.y
}
else{
	is_show_prompt = false;
}