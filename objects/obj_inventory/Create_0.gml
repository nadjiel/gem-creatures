/// @description Variable declarations

// Input variables
opened = false;

keys = {
	enter: false
};

// Inventory content
content = new Inventory();

// GUI variables
menu_x = 0;
menu_y = 0;
rows = undefined;
row_size = TILE_SIZE;
columns = 3;
column_size = TILE_SIZE * 2.25;
x_gap = TILE_SIZE * 0.25;
y_gap = TILE_SIZE * 0.25;
x_padding = TILE_SIZE / 2;
y_padding = TILE_SIZE / 2;
width = x_padding * 2 + columns * column_size + x_gap * (columns - 1);
// WARNING: This uses the unupdated GUI height
height = display_get_gui_height() - menu_y;

/**
 * @desc Updates the selected item via mouse hovering
 */
move_cursor = function() {
	if(!opened) return;
	if(array_length(content.items) == 0) return;
	if(!point_in_rectangle(
		device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
		menu_x + x_padding, menu_y + y_padding,
		menu_x + width - x_padding, menu_y + display_get_gui_height() - y_padding
	)) return;
	
	for(var _i = 0; _i < array_length(content.items); _i++) {
		var _row = _i div columns;
		var _column = _i mod columns;
		
		var _x = menu_x + x_padding + x_gap * _column + column_size * _column;
		var _y = menu_y + y_padding + y_gap * _row + row_size * _row;
		
		if(!point_in_rectangle(
			device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
			_x, _y,
			_x + column_size, _y + row_size
		)) continue;
		
		content.selected = _i;
	}
}
