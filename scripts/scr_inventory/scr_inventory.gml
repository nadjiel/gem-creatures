/**
 * @desc A manager for the game inventory
 */
function Inventory() constructor {
	
	items = [];
	selected = -1;

	/**
	 * @desc Adds an item to the inventory
	 * @param {String} _name the name of the item to add
	 */
	static add_item = function(_name) {
		var _item_index = array_find_index(items, method(
			{ name: _name },
			function(_slot) {
				return _slot.item.name == name;
			}
		));
	
		if(_item_index == -1) {
			array_insert(items, 0, new Slot(create_item(_name)));
		
			return;
		};
	
		items[_item_index].increment();
	}

	/**
	 * @desc Removes an item from the inventory by a specified amount
	 * @param {Struct.Item} _item the item to remove
	 * @param {Real} _amount the amount of this item to remove
	 */
	static remove_item = function(_item, _amount = 1) {
		var _i = array_find_index(items, method(
			{ name: _item.name },
			function(_slot) {
				return _slot.item.name == name;
			}
		));
	
		if(_i == -1) return;
		
		items[_i].decrement(_amount);
		
		if(items[_i].amount == 0) array_delete(items, _i, 1);
		if(selected == _i) selected = -1;
	}
	
	static toString = function() {
		var _result = "  [ ";
		var _marker = "^";
		var _marker_space = 0;
		
		for(var _i = 0; _i < array_length(items); _i++) {
			if(selected == _i) _marker_space = string_length(_result);
			
			_result += string(items[_i]);
			
			if(_i + 1 != array_length(items)) _result += ", ";
		}
		_result += " ]\n";
		_result += string_repeat(" ", _marker_space) + _marker + "\n";
		_result += string_repeat(" ", _marker_space) + string(selected);
		
		return _result;
	}
	
}
