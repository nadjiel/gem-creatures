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

items = [];
selected_slot = 0;

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

create_item = function(_name) {
	switch(_name) {
		case "banana": return new BananaItem();
		case "honeycomb": return new HoneycombItem();
		case "mushroom": return new MushroomItem();
		case "pineapple": return new PineappleItem();
	}
}

/**
 * @desc Adds an item to the inventory
 * @param {String} _name the name of the item to add
 */
add_item = function(_name) {
	var _i = array_find_index(items, method({ name: _name }, function(_slot) {
		return _slot.item.compare_name(name);
	}));
	
	if(_i == -1) {
		array_insert(items, 0, new Slot(create_item(_name)));
		array_first(items).amount++;
		
		return;
	};
	
	items[_i].amount++;
}
