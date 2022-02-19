/// @description Open door if player has key
// You can write your code in this editor

if (obj_player.hasKey && place_meeting(x,y, obj_player)){
	instance_destroy(self);
	audio_play_sound(sound_door, 2, false);
}