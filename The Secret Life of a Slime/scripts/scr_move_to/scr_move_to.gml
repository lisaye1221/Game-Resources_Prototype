// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function go_to_town(player){
	room_goto(town)
	audio_stop_sound(bgm_home);
	audio_play_sound(bgm_town, 1, true);
	player.sprite = player.human_sprite;
	player.face = RIGHT;
	player.x = TOWN_X;
	player.y = TOWN_Y;
}

function go_home(player){
	room_goto(home)
	audio_stop_sound(bgm_town);
	audio_play_sound(bgm_home, 1, true);
	player.sprite = player.slime_sprite;
	player.face = LEFT;
	player.x = HOME_X;
	player.y = HOME_Y;
}