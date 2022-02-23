/// @description Insert description here
// You can write your code in this editor

if not global.dead {
	// day and time
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(15, 560, "Time: " + string(floor(global.time)));

	// gold
	draw_set_color(c_yellow);
	draw_text(15, 580, "Gold: " + string(floor(global.gold)) + "G");

	// energy
	draw_set_color(c_aqua);
	draw_text(15, 655, "Energy: " + string(floor(global.energy)));
	draw_healthbar(15, 670, 445, 690, global.energy, c_grey, c_aqua, c_aqua, 0, true, true);
}
else {
	draw_set_halign(fa_center);
	draw_text(300, 300, "You die of starvation after living "+ string(floor(global.time)) +" minutes, PRESS R TO PLAY AGAIN!");
}