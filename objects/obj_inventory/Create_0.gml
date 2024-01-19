/// @description Variable declarations

opened = false;

keys = {
	enter: false,
	right: false,
	up: false,
	left: false,
	down: false
};
input_x = 0;
input_y = 0;

content = new Inventory();

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

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
height = gui_height - menu_y;

move_cursor = function() {
	if(!opened) return;
	if(array_length(content.items) == 0) return;
	
	var _total_rows = ceil(array_length(content.items) / columns);
	
	var _row = content.selected div columns;
	var _column = content.selected mod columns;
	
	show_debug_message("{0} {1} {2}", _row * columns + _column, _row, _column)
	
	content.selected += input_x;
	if(content.selected == -1) content.selected = array_length(content.items) - 1;
	if(content.selected == array_length(content.items)) content.selected = 0;
	
	content.selected += input_y * columns;
	if(content.selected < 0) {
		content.selected = (_total_rows - 1) * columns + _column;
		if(content.selected > array_length(content.items) - 1) content.selected -= columns;
	}
	if(content.selected > array_length(content.items) -1) content.selected = _column;
	
}
