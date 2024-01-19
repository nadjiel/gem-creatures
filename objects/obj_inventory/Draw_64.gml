/// @description Draw inventory

// Draw inventory, if opened
if(opened) {
	// Inventory background
	draw_sprite_ext(
		spr_inventory_bg, 0,
		menu_x,
		menu_y,
		width / sprite_get_width(spr_inventory_bg),
		height / sprite_get_height(spr_inventory_bg),
		0, c_white, 1
	);
	
	// Draw inventory items
	var _x = menu_x + x_padding;
	var _y = menu_y + y_padding;
	for(var _i = 0; _i < array_length(content.items); _i++) {
		// If there's 0 of this item, skip it
		if(content.items[_i].amount == 0) continue;
		
		// Draw cursor if item is selected
		if(content.selected == _i) {
			draw_sprite_ext(
				spr_inventory_cursor, 0,
				_x, _y,
				column_size / sprite_get_width(spr_inventory_cursor),
				1,
				0, c_white, 1
			);
		}
		
		// Draw item
		var _item_sprite = content.items[_i].item.sprite;
		draw_sprite(
			_item_sprite,
			0,
			_x + sprite_get_xoffset(_item_sprite) + sprite_get_width(_item_sprite) * 0.125,
			_y + sprite_get_yoffset(_item_sprite)
		);
		
		// Draw amount of the item
		draw_set_font(global.font);
		draw_set_color(c_black);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text(
			_x + column_size - TILE_SIZE * 0.25,
			_y + row_size,
			content.items[_i].amount
		);
		
		// Increment drawing position
		_x += column_size + x_gap;
		if(_x > menu_x + width - x_padding - column_size) {
			_y += row_size + y_gap;
			_x = menu_x + x_padding;
		}
	}
}
