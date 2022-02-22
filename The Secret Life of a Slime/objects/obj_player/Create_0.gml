/// @description Insert description here
// You can write your code in this editor

x_spd = 0;
y_spd = 0;
move_spd = 2;
image_speed = 0.3;

slime_sprite[RIGHT] = spr_slime_right;
slime_sprite[UP] = spr_slime_up;
slime_sprite[LEFT] = spr_slime_left;
slime_sprite[DOWN] = spr_slime_down;

human_sprite[RIGHT] = spr_person_right;
human_sprite[UP] = spr_person_up;
human_sprite[LEFT] = spr_person_left;
human_sprite[DOWN] = spr_person_down;

sprite = slime_sprite
face = DOWN;

global.energy = 100;
global.energy_max=100;
global.gold = 10;