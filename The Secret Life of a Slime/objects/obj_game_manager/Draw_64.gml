/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_color(c_white)
draw_text(15, 560, "day: " + string(floor(global.days)));
draw_text(15, 580, "time: " + string(floor(global.time)));
draw_set_halign(fa_center);
draw_text(450, 600, "energy: " + string((global.energy)));
draw_healthbar(145, 620, 745, 640,global.energy, c_grey, c_red, c_lime, 0, true, true);