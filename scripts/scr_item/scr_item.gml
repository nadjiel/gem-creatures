/**
 * @desc Constructor to an item
 */
function Item() constructor {
	
	name = "";
	
	/**
	 * @desc Returns a boolean comparing the item name with the passed name
	 * @param {String} _name the name to compare to
	 */
	static compare_name = function(_name) {
		return name == _name;
	}
	
	static toString = function() {
		return name;
	}
	
}
