/// @description Inventory management

keys.enter = keyboard_check_pressed(vk_enter);
keys.right = keyboard_check_pressed(vk_right);
keys.up = keyboard_check_pressed(vk_up);
keys.left = keyboard_check_pressed(vk_left);
keys.down = keyboard_check_pressed(vk_down);

input_x = keys.right - keys.left;
input_y = keys.down - keys.up;

if(keys.enter) opened = !opened;

move_cursor = function() {
	if(!opened) return;
	if(array_length(items) == 0) return;
	
	var _total_rows = ceil(array_length(items) / columns);
	
	var _row = selected_slot div columns;
	var _column = selected_slot mod columns;
	
	show_debug_message("{0} {1} {2}", _row * columns + _column, _row, _column)
	
	selected_slot += input_x;
	if(selected_slot == -1) selected_slot = array_length(items) - 1;
	if(selected_slot == array_length(items)) selected_slot = 0;
	
	selected_slot += input_y * columns;
	if(selected_slot < 0) {
		selected_slot = (_total_rows - 1) * columns + _column;
		if(selected_slot > array_length(items) - 1) selected_slot -= columns;
	}
	if(selected_slot > array_length(items) -1) selected_slot = _column;
	
}

move_cursor();
