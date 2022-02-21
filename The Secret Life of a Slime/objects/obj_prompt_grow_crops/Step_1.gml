/// @description Insert description here
// You can write your code in this editor

// show alt_text if crops aren't ready to harvest yet
if (instance_find(obj_crop,0).harvestable == false){
	show_alt = true;
} else {
	show_alt = false;
}