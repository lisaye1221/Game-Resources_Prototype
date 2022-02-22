/// @description Insert description here
// You can write your code in this editor

// draw inventory background

for(var i = 0; i < MAX_ITEM; i++){
	// calculate position
	height = INV_BACKGROUND_HEIGHT;
	space = INV_BACKGROUND_MARGIN;
	y1 = INV_TOP_LEFT_Y + (i*(height + space));
	draw_set_color(c_gray);
	draw_roundrect(INV_LEFT_X, y1, INV_RIGHT_X, y1+height, false)
	draw_set_color(c_white);
	draw_set_valign(fa_center);
	draw_set_halign(fa_right);
	draw_text(INV_LEFT_X - space, y1+(height/2),"[" + string(i+1) + "]");
}

// draw inventory
for(var i = 0; i < array_length(inventory); i++){
	
	height = INV_BACKGROUND_HEIGHT;
	space = INV_BACKGROUND_MARGIN;
	y1 = INV_TOP_LEFT_Y + (i*(height + space));
	margin = (INV_BACKGROUND_HEIGHT - ICON_SIZE) / 2;
	
	// icon
	draw_sprite(inventory[i].icon, 0, INV_LEFT_X + space, y1+margin);
	// item name
	draw_set_valign(fa_center);
	draw_set_halign(fa_left);
	draw_text(INV_LEFT_X + ICON_SIZE + (space * 2), y1+(height/2), inventory[i].name);
	// count
	draw_set_halign(fa_right);
	draw_text(INV_RIGHT_X - space, y1+(height/2), "x" + string(inventory[i].count));

	
	
}