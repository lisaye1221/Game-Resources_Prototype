/// @description Insert description here
// You can write your code in this editor
event_inherited()

prompt_text = obj_game_manager.transformation_cooldown <= 0 
				?"to village?"
				:"cooldown:" + string(ceil(obj_game_manager.transformation_cooldown));