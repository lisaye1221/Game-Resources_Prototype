/// @description Insert description here
// You can write your code in this editor
event_inherited();

if(place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("Z"))){
	paused = true;
	if (!sprite_exists(screenshot)){
		sprite_create_from_surface(application_surface, 0,0,view_wport, view_hport, 0,0,0,0);
	}
}

if (paused){
	instance_deactivate_all(1);
	instance_activate_object(obj_buyfood_menu);
} else {
	if (sprite_exists(screenshot)){
		sprite_delete(screenshot);
	}
	instance_activate_all();
	instance_deactivate_object(obj_sell_menu);
	instance_deactivate_object(obj_buyfood_menu);
	instance_deactivate_object(obj_buyparts_menu);
	//instance_deactivate_object(obj_menu);
}