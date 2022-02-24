// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function go_to_town(player){
	if(obj_game_manager.transformation_cooldown <= 0){
		room_goto(town)
		audio_stop_sound(bgm_home);
		audio_play_sound(bgm_town, 1, true);
		obj_game_manager.is_room_transition = true;
		player.sprite = player.human_sprite;
		player.face = RIGHT;
		player.x = TOWN_X;
		player.y = TOWN_Y;
	}
}

function go_home(player){
	room_goto(home)
	audio_stop_sound(bgm_town);
	audio_play_sound(bgm_home, 1, true);
	obj_game_manager.is_room_transition = true;
	player.sprite = player.slime_sprite;
	player.face = LEFT;
	player.x = HOME_X;
	player.y = HOME_Y;
}

function forced_home(player){
	go_home(player);
	global.energy -= obj_game_manager.EXCEED_TIME_ENERGY_COST;
}

function die() {
	if(!global.dead){
		audio_stop_all();
		// sad death music ?
		global.dead = true;
		room_goto(lose);
		instance_deactivate_all(false);
		instance_activate_object(obj_game_manager);
	}
}