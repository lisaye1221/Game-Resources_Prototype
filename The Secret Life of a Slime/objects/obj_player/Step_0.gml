/// @description Insert description here
// You can write your code in this editor

key_up = keyboard_check(vk_up);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);

x_speed = (key_right - key_left) * move_spd;
y_speed = (key_down - key_up) * move_spd;

if(place_meeting(x+x_speed, y, obj_solid)){
	x_speed = 0;
}
if(place_meeting(x, y+y_speed, obj_solid)){
	y_speed = 0;
}

// move the player
x += x_speed;
y += y_speed;

// set sprite 	
if(y_speed > 0) {face = DOWN;}
if(y_speed < 0) {face = UP;}
if(x_speed > 0) {face = RIGHT;}
if(x_speed < 0) {face = LEFT;}
sprite_index = sprite[face]