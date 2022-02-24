/// @description Insert description here
// You can write your code in this editor

event_inherited();
// main menu
option[0,0] = "Buy Wheat?";
option[0,1] = "Buy Berries?";
option[0,2] = "Buy Fish?";
option[0,3] = "Exit";

interactable[0,0] = true;
interactable[0,1] = true;
interactable[0,2] = true;
interactable[0,3] = true;

// wheat menu
option[1,0] = "You have # gold";	// not clickable
option[1,1] = "+";
option[1,2] = "# wheat (8 gold)";		// input field
option[1,3] = "-";
option[1,4] = "Buy";
option[1,5] = "Back";
requested_wheat = 0;
wheat_price = 8;

interactable[1,0] = false;
interactable[1,1] = true;
interactable[1,2] = false;
interactable[1,3] = true;
interactable[1,4] = true;
interactable[1,5] = true;

// berries menu
option[2,0] = "You have # gold";
option[2,1] = "+";
option[2,2] = "# berries (2 gold)";
option[2,3] = "-";
option[2,4] = "Buy";
option[2,5] = "Back";
requested_berries = 0;
berry_price = 2;

interactable[2,0] = false;
interactable[2,1] = true;
interactable[2,2] = false;
interactable[2,3] = true;
interactable[2,4] = true;
interactable[2,5] = true;

// fish menu
option[3,0] = "You have # gold";
option[3,1] = "+";
option[3,2] = "# fish (15 gold)";
option[3,3] = "-";
option[3,4] = "Buy";
option[3,5] = "Back";
requested_fish = 0;
fish_price = 15;

interactable[3,0] = false
interactable[3,1] = true;
interactable[3,2] = false;
interactable[3,3] = true;
interactable[3,4] = true;
interactable[3,5] = true;

instance_deactivate_object(self);