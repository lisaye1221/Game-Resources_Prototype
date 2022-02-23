/// @description Insert description here
// You can write your code in this editor

depth = -9999;

// the max amount before it counts as a seperate item
#macro FOOD_MAX 24
#macro SLIME_JELLY_MAX 2

MAX_ITEM = 6;

INV_LEFT_X = 680;
INV_BACKGROUND_WIDTH = 200;
INV_BACKGROUND_HEIGHT = 20;
INV_BACKGROUND_MARGIN = 5;
INV_RIGHT_X = INV_LEFT_X + INV_BACKGROUND_WIDTH;
INV_TOP_LEFT_Y = 550;
ICON_SIZE = 16;

// item constructor
function create_item(_name, _icon, _max_count, _count) constructor {
	name = _name;
	icon = _icon;
	max_count = _max_count;
	count = _count;
	
}

// create the items masterlist
global.item_list = 
{
	slime_jelly : new create_item(
		"Slime Jelly",
		spr_item_jelly,
		SLIME_JELLY_MAX, 
		0
	),
	berries : new create_item(
		"Berries",
		spr_item_berries,
		FOOD_MAX, 
		0
	),
	wheat : new create_item(
		"Wheat",
		spr_item_wheat,
		FOOD_MAX, 
		0
	),
	fish: new create_item(
		"Fish",
		spr_item_fish,
		5,
		0
	)
}

// create the inventory
inventory = array_create(0);
