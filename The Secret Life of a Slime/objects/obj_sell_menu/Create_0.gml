/// @description Insert description here
// You can write your code in this editor
width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

// main menu
option[0,0] = "Sell Wheat?";
option[0,1] = "Sell Berries?";
option[0,2] = "Exit";

// wheat menu
option[1,0] = "Window Size";
option[1,1] = "Brightness";
option[1,2] = "Controls";
option[1,3] = "Back";

// berries menu
option[2,0] = "Size";
option[2,1] = "tness";
option[2,2] = "Cols";
option[2,3] = "Bk";

op_length = 0;
menu_level = 0;

// to pause while menu is active
paused = false;
screenshot = -1;