/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("Z"))){
	global.player_in_shop = true;
	instance_deactivate_object(obj_player);
	instance_activate_object(obj_buyparts_menu);
	instance_activate_object(obj_inventory_manager);
	instance_activate_object(obj_game_manager);
	show_debug_message("true")
}

if (should_close_menu){
	instance_activate_all();
	global.player_in_shop = false;
	instance_deactivate_object(obj_sell_menu);
	instance_deactivate_object(obj_buyfood_menu);
	instance_deactivate_object(obj_buyparts_menu);
	should_close_menu = false;
}