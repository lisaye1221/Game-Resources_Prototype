/// @description Insert description here
// You can write your code in this editor

// get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// num options in current menu
op_length = array_length(option[menu_level]);

// current inventory
option[1,0] = "You have " + string(get_item_count(global.item_list.wheat)) + " wheat";
option[2,0] = "You have " + string(get_item_count(global.item_list.berries)) + " berries";
option[1,2] = string(offered_wheat) + " wheat";
option[2,2] = string(offered_berries) + " berries";
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
				// sell wheat
				case 0:
					menu_level = 1;
					break;
				// sell berries
				case 1:
					menu_level = 2;
					break;
				// exit
				case 2:
					this_prompt = instance_find(obj_prompt_sell, 0);
					if (this_prompt != noone){
						this_prompt.paused = false;
					}
					break;}
			break;
		
		// wheat menu
		case 1:
			switch (pos){
				// you have # wheat
				case 0:
					break;
				// +
				case 1:
					if (offered_wheat < get_item_count(global.item_list.wheat)) offered_wheat++;
					break;
				// # wheat
				case 2:
					break;
				// -
				case 3:
					if(offered_wheat > 0) offered_wheat--;
					break;
				// sell
				case 4:
					global.gold += (offered_wheat * wheat_price);
					lose_item(global.item_list.wheat, offered_wheat);
					offered_wheat = 0;
					break;
				// back
				case 5:
					offered_wheat = 0;
					menu_level = 0;
					break;}
		
		// berries menu
		case 2:
			switch (pos){
				// you have # berries
				case 0:
					break;
				// +
				case 1:
					if (offered_berries < get_item_count(global.item_list.berries)) offered_berries++;
					break;
				// # berries
				case 2:
					break;
				// -
				case 3:
					if (offered_berries > 0) offered_berries--;
					break;
				// sell
				case 4:
					global.gold += (offered_berries * berry_price);
					lose_item(global.item_list.berries, offered_berries);
					offered_berries = 0;
					break;
				// back
				case 5:
					offered_berries = 0;
					menu_level = 0;
					break;}
	}
	// reset pos
	if (_ml != menu_level) pos = 0;
	op_length = array_length(option[menu_level]);
}