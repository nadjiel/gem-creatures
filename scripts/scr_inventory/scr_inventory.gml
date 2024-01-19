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
	add_item = function(_name) {
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
	
}
