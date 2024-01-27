/**
 * @desc Constructor to an inventory slot
 * @param {Struct.Item} _item the item of the slot
 * @param {Real} _max the maximum amount that this slot can hold of its item (default is 99)
 */
function Slot(_item, _max = 99) constructor {
	
	item = _item;
	amount = 1;
	max_amount = _max;
	
	/**
	 * @desc Increments to the item amount, respecting its maximum capacity
	 * @param {Real} _amount the amount by which to increment (defaults to 1)
	 */
	static increment = function(_amount = 1) {
		amount = clamp(amount + _amount, 0, max_amount);
	}
	
	/**
	 * @desc Decrements the item amount
	 * @param {Real} _amount the amount by which to decrement (defaults to 1)
	 */
	static decrement = function(_amount = 1) {
		amount = clamp(amount - _amount, 0, max_amount);
	}
	
	static toString = function() {
		return string("{0}: {1} / {2}", item, amount, max_amount);
	}
	
}
