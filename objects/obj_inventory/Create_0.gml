/// @description Variable declarations

// Inventory state
opened = false;

// Input variables
keys = {
	enter: false,
	confirm: false
};

// Inventory content
content = new Inventory();

// GUI variables
x = 0;
y = 0;
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
height = display_get_gui_height() - y;

focused = true;

/**
 * @desc Updates the selected item via mouse hovering
 */
move_cursor = function() {
	if(!opened) return;
	if(array_length(content.items) == 0) return;
	
	var _mouse_position = new Vector2(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	
	// Mouse is out of inventory
	if(!point_in_rectangle(
		_mouse_position.x, _mouse_position.y,
		x + x_padding, y + y_padding,
		x + width - x_padding, y + display_get_gui_height() - y_padding
	)) return;
	
	// Looks for hovering
	for(var _i = 0; _i < array_length(content.items); _i++) {
		var _row = _i div columns;
		var _column = _i mod columns;
		
		var _x = x + x_padding + x_gap * _column + column_size * _column;
		var _y = y + y_padding + y_gap * _row + row_size * _row;
		
		if(!point_in_rectangle(
			_mouse_position.x, _mouse_position.y,
			_x, _y,
			_x + column_size, _y + row_size
		)) continue;
		
		// Updates selected item
		content.selected = _i;
		
		// Opens item popup
		if(keys.confirm) {
			instance_create_layer(
				_mouse_position.x, _mouse_position.y,
				"Instances", obj_popup,
				{
					x: _mouse_position.x,
					y: _mouse_position.y,
					focused: true
				}
			);
			focused = false;
		}
	}
}
