/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_halign(fa_center);
if(is_show_prompt){
	if(player_x > room_width - BOUNDARY_SPACE){
		x_pos = room_width - BOUNDARY_SPACE;
	}
	else if(player_x < BOUNDARY_SPACE){
		x_pos = BOUNDARY_SPACE;
	}
	else{
		x_pos = player_x
	}
	y_pos = player_y - y_offset < 0 ? 0 : player_y - y_offset;
	draw_text(x_pos, y_pos, prompt_text);
}