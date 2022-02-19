/// @description Destroy self when picked up
// You can write your code in this editor

if (place_meeting(x,y,obj_player)){	// if player collides w key, 
	instance_destroy(self);
	obj_player.hasKey = true;
	audio_play_sound(sound_key, 1, false);
}