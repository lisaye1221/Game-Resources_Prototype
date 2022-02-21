/// @description Insert description here
// You can write your code in this editor

// show alt_text if crops aren't ready to harvest yet
this_crop = instance_find(obj_crop, 0);
if (this_crop != noone){
	switch (this_crop.harvestable){
		case true:
			which_text = 0;
			break;
		case false:
			which_text = 1;
			break;
	}
}