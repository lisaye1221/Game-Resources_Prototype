// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_town(player){
	room_goto(town)
	//audio_stop_sound(bgm_home);
	//audio_play_sound(bgm_town, 1, true);
	player.x = TOWN_X;
	player.y = TOWN_Y;
}