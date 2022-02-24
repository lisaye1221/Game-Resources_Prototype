/// @description Insert description here
// You can write your code in this editor

depth = -y;

if not global.dead {

	key_up = keyboard_check(vk_up);
	key_right = keyboard_check(vk_right);
	key_down = keyboard_check(vk_down);
	key_left = keyboard_check(vk_left);
	key_z = keyboard_check_pressed(ord("Z"));

	key_1 = keyboard_check_pressed(ord("1"));
	key_2 = keyboard_check_pressed(ord("2"));
	key_3 = keyboard_check_pressed(ord("3"));
	key_4 = keyboard_check_pressed(ord("4"));
	key_5 = keyboard_check_pressed(ord("5"));
	key_6 = keyboard_check_pressed(ord("6"));

	// ** Movement ** //

	x_speed = (key_right - key_left) * move_spd;
	y_speed = (key_down - key_up) * move_spd;

	// set sprite direction	
	if(y_speed > 0) {face = DOWN;}
	if(y_speed < 0) {face = UP;}
	if(x_speed > 0) {face = RIGHT;}
	if(x_speed < 0) {face = LEFT;}
	sprite_index = sprite[face]
	// set collision for solid
	if(place_meeting(x+x_speed, y, obj_solid)){
		x_speed = 0;
	}
	if(place_meeting(x, y+y_speed, obj_solid)){
		y_speed = 0;
	}
	if(x+x_speed > room_width || x+x_speed < 0){
		x_speed = 0;
	}
	if(y+y_speed < 0 || y+y_speed >  525){
		y_speed = 0;
	}
	// move the player
	x += x_speed;
	y += y_speed;
	// set animation to not moving 
	if(x_speed == 0 && y_speed == 0){
		image_index = 0;
	}
	
	if (global.force_player_home) {
		global.force_player_home = false;
		forced_home(id);
	}

	// ** Interaction ** //
	if(place_meeting(x, y, obj_prompt_town) && key_z){
		go_to_town(self);
	}
	if(place_meeting(x,y, obj_prompt_home) && key_z){
		go_home(self);
	}
	if(place_meeting(x, y, obj_prompt_grow_crops) && key_z){
		// checking to see if crops are done growing (if any one is done, all are)
		if (instance_find(obj_crop,0).harvestable == true){
		
			// TODO: should we make this take time (time delay here?)
		
		
			// adding crops to player's inventory & subtracting energy cost
			gain_item(global.item_list.wheat, 8);
			global.energy -= 10;
		
			// resetting all crops in scene so they will grow again
			for (var i = 0; i < instance_number(obj_crop); i ++;)
			{
			    with (instance_find(obj_crop,i)){
					crop_growth_remaining = crop_growth_time;
					harvestable = false;
				}
			}
		}
	}
	if(place_meeting(x, y, obj_use_machine) && key_z){
	
	
		// TODO: automatically takes all now, we could let player choose how much to convert
		
		
		this_machine = instance_find(obj_machine, 0);
		if (this_machine != noone){
			// inputting wheat if they have any in inventory
			if (this_machine.status == "empty" && 
				get_item_count(global.item_list.wheat) >= this_machine.WHEAT_COST){
				// take wheat from player, start timer, show progress bar
				this_machine.amount_to_convert = this_machine.WHEAT_COST;
				lose_item(global.item_list.wheat, 8);
				this_machine.status = "busy";
				this_machine.durability -= 1;
				
				// change text
			} 
			
			else if (this_machine.status == "busy" || this_machine.status == "repairing"){
				// do nothing
			}
			
			// collecting wheat
			else if (this_machine.status == "full"){
				// take energy, disable progress bar, reset vars
				if(will_item_fit(global.item_list.slime_jelly, this_machine.JELLY_PRODUCED)){
					gain_item(global.item_list.slime_jelly, this_machine.JELLY_PRODUCED);
					// check if machine has broken
					if (this_machine.durability <= 0) {
						this_machine.status = "broken";
					}
					else{
						this_machine.status = "empty";
					}
				}
				// change text
			} 
		
		
			// TODO: repairing machine
		
		
			else if (this_machine.status == "broken" && get_item_count(global.item_list.parts) >= 1){
				// do something (take gold or parts or whatever from player and wait for repair)
				
				lose_item(global.item_list.parts, 1);
				global.energy -= 10;
				
				// change status to "empty"
				// change text
				
				this_machine.status = "repairing";
				this_machine.durability = 2;
				
				
				
			}
		}
	}

	// berry bushes
	berry_bush_id = instance_place(x, y, obj_bush);
	if(berry_bush_id != noone && key_z && berry_bush_id.has_berries){
		berry_bush_id.has_berries = false;
		// add 1 unit of berries to inventory
		gain_one_item(global.item_list.berries);
	}


	// using items
	inv = obj_inventory_manager.inventory
	inv_count = array_length(inv);
	if(key_1 && inv_count >= 1){
		use_item(inv[0]);
	}
	if(key_2 && inv_count >= 2){
		use_item(inv[1]);
	}
	if(key_3 && inv_count >= 3){
		use_item(inv[2]);
	}
	if(key_4 && inv_count >= 4){
		use_item(inv[3]);
	}
	if(key_5 && inv_count >= 5){
		use_item(inv[4]);
	}
	if(key_6 && inv_count >= 6){
		use_item(inv[5]);
	}


	function use_item(item){
		switch(item.name){
			case global.item_list.berries.name:
				increase_energy(3);
				lose_one_item(item);
			break;
			case global.item_list.slime_jelly.name:
				increase_energy(10);
				lose_one_item(item);
			break;
			case global.item_list.fish.name:
				increase_energy(6);
				lose_one_item(item);
			default:
				return;
		}
	}
	
	function increase_energy(amount){
		newAmount = amount + global.energy;
		global.energy = newAmount > global.energy_max ? global.energy_max : newAmount;
	}

	// death
	if (global.energy <= 0) {
		// die
		die();
	}
}