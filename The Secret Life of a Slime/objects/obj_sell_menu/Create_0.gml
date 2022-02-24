/// @description Insert description here
// You can write your code in this editor

event_inherited();
// main menu
option[0,0] = "Sell Wheat?";
option[0,1] = "Sell Berries?";
option[0,2] = "Exit";

// wheat menu
option[1,0] = "You have # wheat";	// not clickable
option[1,1] = "+";
option[1,2] = "# wheat";		// input field
option[1,3] = "-";
option[1,4] = "Sell";
option[1,5] = "Back";
offered_wheat = 0;

// berries menu
option[2,0] = "You have # berries";
option[2,1] = "+";
option[2,2] = "# berries";
option[2,3] = "-";
option[2,4] = "Sell";
option[2,5] = "Back";
offered_berries = 0;

instance_deactivate_object(self);