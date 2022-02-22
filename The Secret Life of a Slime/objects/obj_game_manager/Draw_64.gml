/// @description Insert description here
// You can write your code in this editor

// day and time
draw_set_halign(fa_left);
draw_set_color(c_white)
draw_text(15, 560, "Day: " + string(floor(global.days)));
draw_text(15, 580, "time: " + string(floor(global.time)));

// gold
draw_text(15, 600, "Gold: " + string(floor(global.gold)) + "G");

// energy
draw_text(15, 645, "Energy: " + string(floor(global.energy)));
draw_healthbar(15, 670, 445, 690, global.energy, c_grey, c_red, c_lime, 0, true, true);

// inventory
// draw_text(15, 660, "wheat: " + string(floor(global.wheat)));
// draw_set_halign(fa_right);
// draw_text(885, 660, "slime energy: " + string(floor(global.slime_energy)));