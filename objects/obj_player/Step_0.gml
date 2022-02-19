depth = -y;

// makes camera follow player

var cwidth = camera_get_view_width(view_camera[0]);	// view_camera[0] is first viewport in array of viewports
var cheight = camera_get_view_height(view_camera[0]);

// collisions
// place_meeting(x , y, obj)  = checks if the player has collided with the tree (if the player's x and y values are overlapping with the object)

if (place_meeting(prev_x, y, obj_NPC1) || place_meeting(prev_x, y, obj_NPC2) 
|| place_meeting(prev_x, y, obj_brick) || place_meeting(prev_x,y, obj_door))
{	// checks if colliding in y - direction
	y = prev_y;
}
	
if (place_meeting(x, prev_y, obj_NPC1) || place_meeting(x, prev_y, obj_NPC2) 
|| place_meeting(x, prev_y, obj_brick) || place_meeting(x, prev_y, obj_door))
{	// checks if colliding in x - direction
	x = prev_x;
}
// allows player to still move in the correct direction if moving diagonally while colliding


camera_set_view_pos(view_camera[0], x - cwidth/2, y - cheight/2);	// sets camera position to where the player is with the player in the center of the frame

// add animation code, if 'w' iterate through up animations
// Image x scale to reverse image

if (!(keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D")))){
	sprite_index = spr_player_idle;
	image_index = last_animation_index;	// prevents automatic animations
}

if (keyboard_check(ord("W"))){
	
	sprite_index = spr_player_walk_up;
	
	last_animation_index = 1;
}

if (keyboard_check(ord("S"))){

	sprite_index = spr_player_walk_down;
	
	last_animation_index = 0;
}

if (keyboard_check(ord("A"))){

	sprite_index = spr_player_walk_side;
	
	last_animation_index = 2; 
	image_xscale = -1;	// reverse image
}

if (keyboard_check(ord("D"))){

	sprite_index = spr_player_walk_side;
	
	last_animation_index = 2;
	image_xscale = 1;
}


if !(place_meeting(x + 20, y, obj_NPC1) || place_meeting(x, y + 20, obj_NPC1) || place_meeting(x - 20, y, obj_NPC1) || place_meeting(x, y - 20, obj_NPC1)){	// if colliding w NPC
	obj_NPC1_text1.visible = false;	// remove text box if player walks away
	obj_NPC1_text2.visible = false;
}

if !(place_meeting(x + 20, y, obj_NPC2) || place_meeting(x, y + 20, obj_NPC2) || place_meeting(x - 20, y, obj_NPC2) || place_meeting(x, y - 20, obj_NPC2)){	// if colliding w NPC
	obj_NPC2_text.visible = false;	// remove text box if player walks away
}

if ((x > 510 && x < 640) && (y > -950 && y < -850)){	// if player enters exit door/tree
	audio_play_sound(sound_game_end, 4, false);
	room_goto(start_screen);	// go back to start screen
}

prev_x = x;
prev_y = y;