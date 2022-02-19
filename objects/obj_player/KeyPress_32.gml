/// @description Talk to NPCs

if (room == main_level){
	if (place_meeting(x + 20, y, obj_NPC1) || place_meeting(x, y + 20, obj_NPC1) || place_meeting(x - 20, y, obj_NPC1) || place_meeting(x, y - 20, obj_NPC1)){	// if colliding w NPC
		// open text box NPC 1
		if (!hasKey){
			obj_NPC1_text1.visible = true;
		} else {
			obj_NPC1_text2.visible = true;
		}
		
		audio_play_sound(sound_interact, 3, false);
	}

	if (place_meeting(x + 20, y, obj_NPC2) || place_meeting(x, y + 20, obj_NPC2) || place_meeting(x - 20, y, obj_NPC2) || place_meeting(x, y - 20, obj_NPC2)){	// if colliding w NPC

		// open text box NPC 2
		obj_NPC2_text.visible = true;
		
		audio_play_sound(sound_interact, 3, false);
	}
}