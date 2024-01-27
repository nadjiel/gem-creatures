/// @description Variable definitions

function blur() {
	obj_inventory.focused = true;
	instance_destroy(obj_popup);
}

// Options available
options = [
	{ text: "Use", slot, blur, callback: function() { obj_inventory.content.remove_item(slot.item); blur(); } },
	{ text: "Hold", callback: function(){} },
	{ text: "Cancel", callback: blur }
];

/**
 * @desc Calculates the width based on the widest option text
 */
function calculate_width() {
	return array_reduce(options, function(_prev, _value) {
		return max(_prev, string_width(_value.text));
	}, 0);
}

/**
 * @desc Calculates the height based on the tallest option text
 */
function calculate_height() {
	return array_reduce(options, function(_prev, _value) {
		return max(_prev, string_height(_value.text));
	}, 0);
}

// GUI variables
rows = array_length(options);
row_size = calculate_height();
columns = 1;
column_size = calculate_width();
x_gap = 0;
y_gap = row_size * 0.25;
x_padding = row_size * 0.25;
y_padding = row_size * 0.25;
width = x_padding * 2 + columns * column_size + x_gap * (columns - 1);
height = y_padding * 2 + rows * row_size + y_gap * (rows - 1);

selected = -1;

/**
 * @desc Updates and tries to execute the selected option via mouse
 */
move_cursor = function() {
	var _mouse_position = new Vector2(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
	
	// On mouse click out of popup
	if(!point_in_rectangle(
		_mouse_position.x, _mouse_position.y,
		x + x_padding, y + y_padding,
		x + width - x_padding, y + height - y_padding
	) && obj_input.keys.left_mouse.press) {
		// Calls the "Cancel" callback
		array_last(options).callback();
		return;
	}
	
	// Looks for hover
	for(var _i = 0; _i < array_length(options); _i++) {
		var _row = _i div columns;
		var _column = _i mod columns;
		
		var _x = x + x_padding + x_gap * _column + column_size * _column;
		var _y = y + y_padding + y_gap * _row + row_size * _row;
		
		if(!point_in_rectangle(
			_mouse_position.x, _mouse_position.y,
			_x, _y,
			_x + column_size, _y + row_size
		)) continue;
		
		// Updates the selected option
		selected = _i;
		
		// Calls the callback corresponding to the option clicked
		if(obj_input.keys.left_mouse.press) options[_i].callback();
	}
}
