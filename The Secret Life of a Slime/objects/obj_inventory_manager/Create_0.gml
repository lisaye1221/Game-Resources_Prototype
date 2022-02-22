/// @description Insert description here
// You can write your code in this editor

depth = -9999;

// the max amount before it counts as a seperate item
#macro FOOD_MAX 30
#macro SLIME_JELLY_MAX 5

MAX_ITEM = 6;

INV_LEFT_X = 700;
INV_BACKGROUND_WIDTH = 200;
INV_BACKGROUND_HEIGHT = 20;
INV_BACKGROUND_MARGIN = 5;
INV_RIGHT_X = INV_LEFT_X + INV_BACKGROUND_WIDTH;
INV_TOP_LEFT_Y = 555;
ICON_SIZE = 16;



// create the items masterlist
global.item_list = 
{
	slime_jelly : {
		name: "Slime Jelly",
		energy: 10,
		icon: spr_item_jelly,
		max_count: SLIME_JELLY_MAX, 
		count: 0
	},
	berries : {
		name: "Berries",
		energy: 3, 
		icon: spr_item_berries,
		max_count: FOOD_MAX, 
		count: 2
	},
	wheat : {
		name: "Wheat",
		energy: 0, 
		icon: spr_item_wheat,
		max_count: FOOD_MAX, 
		count: 5
	},
}

// create the inventory
inventory = array_create(0);

// test
array_push(inventory, global.item_list.berries)
array_push(inventory, global.item_list.wheat)

 