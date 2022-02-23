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
option[1,2] = string(requested_wheat) + " wheat (" + string(requested_wheat * wheat_price) + " gold)";		// input field
option[2,2] = string(requested_berries) + " berries (" + string(requested_berries * berry_price) + " gold)";
option[3,2] = string(requested_fish) + " fish (" + string(requested_fish * fish_price) + " gold)";

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
					break;
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
				// +
				case 1:
					if (((requested_wheat+1) * wheat_price) <= global.gold) requested_wheat++;
					break;
				// # wheat
				case 2:
					break;
				// -
				case 3:
					if (requested_wheat > 0) requested_wheat--;
					break;
				// buy
				case 4:
					global.gold -= (requested_wheat * wheat_price);
					gain_item(global.item_list.wheat, requested_wheat);
					requested_wheat = 0;
					break;
				// back
				case 5:
					requested_wheat = 0;
					menu_level = 0;
					break;}
			break;
		
		// berries menu
		case 2:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// +
				case 1:
					if (((requested_berries+1) * berry_price) <= global.gold) requested_berries++;
					break;
				// # berries
				case 2:
					break;
				// -
				case 3:
					if (requested_berries > 0) requested_berries--;
					break;
				// buy
				case 4:
					global.gold -= (requested_berries * berry_price);
					gain_item(global.item_list.berries, requested_berries);
					requested_berries = 0;
					break;
				// back
				case 5:
					requested_berries = 0;
					menu_level = 0;
					break;}
			break;
		
		// fish menu
		case 3:
			switch (pos){
				// you have # gold
				case 0:
					break;
				// +
				case 1:
					if (((requested_fish+1)*fish_price) <= global.gold) requested_fish++;
					break;
				// # fish
				case 2:
					break;
				// -
				case 3:
					if (requested_fish > 0) requested_fish--;
					break;
				// buy
				case 4:
					global.gold -= (requested_fish * fish_price);
					gain_item(global.item_list.fish, requested_fish);
					requested_fish = 0;
					break;
				// back
				case 5:
					requested_fish = 0;
					menu_level = 0;
					break;}
			break;
	}
	// reset pos
	if (_ml != menu_level) pos = 0;
	op_length = array_length(option[menu_level]);
}