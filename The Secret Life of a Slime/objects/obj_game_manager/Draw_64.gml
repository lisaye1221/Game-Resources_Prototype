/// @description Insert description here
// You can write your code in this editor

// day and time
draw_set_halign(fa_left);
draw_set_color(c_white)
draw_text(15, 560, "day: " + string(floor(global.days)));
draw_text(15, 580, "time: " + string(floor(global.time)));

// energy
draw_set_halign(fa_center);
draw_text(450, 600, "energy: " + string((global.energy)));
draw_healthbar(145, 620, 745, 640, global.energy, c_grey, c_red, c_lime, 0, true, true);

// inventory
draw_set_halign(fa_left);
draw_text(15, 660, "wheat: " + string(floor(global.wheat)));
draw_text(15, 680, "gold: " + string(floor(global.gold)));
draw_set_halign(fa_right);
draw_text(885, 660, "slime energy: " + string(floor(global.slime_energy)));