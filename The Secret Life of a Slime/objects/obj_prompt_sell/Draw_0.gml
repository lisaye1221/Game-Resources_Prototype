/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);

if (paused && sprite_exists(screenshot)){
	draw_sprite_ext(screenshot, 0,0,0,1,1,0,c_white, 1);
}