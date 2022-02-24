/// @description Insert description here
// You can write your code in this editor
event_inherited()
cost = obj_machine.ENERGY_COST_TO_REPAIR
prompt_text = "use machine? (" + string(obj_machine.WHEAT_COST) +" wheat)";
alt_prompt_text1 = "converting...";
alt_prompt_text2 = "collect the slime jelly?";
alt_prompt_text3 = "repair machine? (1 parts) ("+ string(floor(cost)) +" energy)";
alt_prompt_text4 = "repairing...";