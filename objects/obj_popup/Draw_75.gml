/// @description Popup drawing

// Draw background
draw_sprite_stretched(spr_popup_bg, 0, x, y, width, height);

// Draw options
for(var _i = 0; _i < array_length(options); _i++) {
	var _row = _i div columns;
	var _column = _i mod columns;
	
	var _x = x + x_padding + x_gap * _column + column_size * _column;
	var _y = y + y_padding + y_gap * _row + row_size * _row;
	
	// Draw cursor if option is selected
	if(selected == _i) {
		draw_sprite_stretched(
			spr_popup_cursor, 0,
			_x, _y,
			column_size, row_size
		);
	}
	
	// Draw option
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(_x, _y, options[_i].text);
}
