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
option[1,2] = string(requested_parts) + " parts (" + string(requested_parts * parts_price) + " gold)";		// input field

if (down_key || up_key){
	// move through menu
	pos += down_key - up_key;
	// loop to top or bottom when out of range
	if (pos >= op_length) pos = 0;
	if (pos < 0) pos = op_length-1;

	while (!interactable[menu_level, pos]){
		pos += down_key - up_key;		// skip to next interactable item
		// loop to top or bottom when out of range
		if (pos >= op_length) pos = 0;
		if (pos < 0) pos = op_length-1;
	}
}

// use options
if (accept_key){
	var _ml = menu_level;
	
	switch (menu_level){
		
		// main menu
		case 0:
			switch (pos){
				// buy parts
				case 0:
					menu_level = 1;
					break;
				// exit
				case 1:
					this_prompt = instance_find(obj_prompt_buyparts, 0);
					if (this_prompt != noone){
						this_prompt.should_close_menu = true;
					}
					break;}
			break;
		
		// parts menu
		case 1:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// +
				case 1:
					if (((requested_parts+1) * parts_price) <= global.gold) requested_parts++;
					break;
				// # parts
				case 2:
					break;
				// -
				case 3:
					if (requested_parts > 0) requested_parts--;
					break;
				// buy
				case 4:
					global.gold -= (requested_parts * parts_price);
					gain_item(global.item_list.parts, requested_parts);
					audio_play_sound(sfx_transaction, 2, false);
					requested_parts = 0;
					break;
				// sell
				case 5:
					menu_level = 0;
					break;}
			break;
	}
	// reset pos
	if (_ml != menu_level) pos = 0;
	op_length = array_length(option[menu_level]);
}