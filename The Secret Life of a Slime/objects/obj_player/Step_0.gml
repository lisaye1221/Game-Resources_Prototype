/// @description Insert description here
// You can write your code in this editor

key_up = keyboard_check(vk_up);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_left = keyboard_check(vk_left);
key_z = keyboard_check_pressed(ord("Z"));

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
// move the player
x += x_speed;
y += y_speed;
// set animation to not moving 
if(x_speed == 0 && y_speed == 0){
	image_index = 0;
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
		global.wheat += 8;
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
		if (this_machine.status == "empty" && global.wheat != 0){
			// take wheat from player, start timer, show progress bar
				
			this_machine.amount_to_convert = global.wheat;
			global.wheat = 0;
			this_machine.status = "busy";
			// change text
		} 
			
		else if (this_machine.status == "busy"){
			// do nothing
		}
			
		// collecting wheat
		else if (this_machine.status == "full"){
			// take energy, disable progress bar, reset vars
				
			global.slime_energy = this_machine.amount_to_convert;
			this_machine.status = "empty";
			// change text
		} 
		
		
		// TODO: repairing machine
		
		
		else if (this_machine.status == "broken"){
			// do something (take gold or parts or whatever from player and wait for repair)
			// change status to "empty"
			// change text
		}
	}
}
// berry bushes
berry_bush_id = instance_place(x, y, obj_bush);
if(berry_bush_id != noone && key_z && berry_bush_id.has_berries){
	berry_bush_id.has_berries = false;
	// TODO: add berry to inventory  
}
	

