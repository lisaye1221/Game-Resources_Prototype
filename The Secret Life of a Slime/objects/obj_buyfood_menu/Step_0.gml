/// @description Insert description here
// You can write your code in this editor

// get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// num options in current menu
op_length = array_length(option[menu_level]);

// current inventory
option[1,0] = "You have " + string(global.gold) + " gold";
option[2,0] = "You have " + string(global.gold) + " gold";
option[3,0] = "You have " + string(global.gold) + " gold";

// move through menu
pos += down_key - up_key;

// loop to top or bottom when out of range
if (pos >= op_length) pos = 0;
if (pos < 0) pos = op_length-1;

// use options
if (accept_key){
	var _ml = menu_level;
	
	switch (menu_level){
		
		// main menu
		case 0:
			switch (pos){
				// buy wheat
				case 0:
					menu_level = 1;
					break;
				// buy berries
				case 1:
					menu_level = 2;
					break;
				// buy fish
				case 2:
					menu_level = 3;
				// exit
				case 3:
					this_prompt = instance_find(obj_prompt_buyfood, 0);
					if (this_prompt != noone){
						this_prompt.paused = false;
					}
					break;}
			break;
		
		// wheat menu
		case 1:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// # wheat
				case 1:
					break;
				// buy
				case 2:
					break;
				// back
				case 3:
					menu_level = 0;
					break;}
		
		// berries menu
		case 2:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// # berries
				case 1:
					break;
				// buy
				case 2:
					break;
				// back
				case 3:
					menu_level = 0;
					break;}
		
		// fish menu
		case 3:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// # fish
				case 1:
					break;
				// buy
				case 2:
					break;
				// back
				case 3:
					menu_level = 0;
					break;}
	}
	// reset pos
	if (_ml != menu_level) pos = 0;
	op_length = array_length(option[menu_level]);
}