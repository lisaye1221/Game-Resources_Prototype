 /// @description Insert description here
// You can write your code in this editor

depth = -y - 30;

interactable = true; // false when we are at town
// statuses are: "empty", "busy", "full", "broken", "repairing"
status = "empty";

//is_converting = false;
amount_to_convert = 0;
time_to_convert = 10;
time_left = time_to_convert;
full_signal = true;		// keep track of exclamation signal status

WHEAT_COST = 8;
JELLY_PRODUCED = 2;

durability = 2;	// uses until it breaks
