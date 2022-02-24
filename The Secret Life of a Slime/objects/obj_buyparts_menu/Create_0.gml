/// @description Insert description here
// You can write your code in this editor

event_inherited();
// main menu
option[0,0] = "Buy Machine Parts?";
option[0,1] = "Exit";

// parts menu
option[1,0] = "You have # gold";	// not clickable
option[1,1] = "+";
option[1,2] = "# parts (10 gold)";		// input field
option[1,3] = "-";
option[1,4] = "Buy";
option[1,5] = "Back";
requested_parts = 0;
parts_price = 10;
instance_deactivate_object(self);