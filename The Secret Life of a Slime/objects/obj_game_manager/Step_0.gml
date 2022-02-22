/// @description Insert description here
// You can write your code in this editor

// records how many seconds passed by
global.time += 1/room_speed;
// 60 seconds = 1 day
global.days = floor(global.time / 60);
// lose 0.1 energy per second
global.energy -= ((0.1/room_speed) * ENERGY_DEPLETION_MULTIPLIER);

if global.dead {
	if (keyboard_check_pressed(ord("R"))) {
		game_restart();
	}
}