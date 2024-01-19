/**
 * @desc Creates an item identified by the passed name
 * @param {String} _name the name of the item to create
 * @returns {Struct.Item} an item corresponding to the received name
 */
function create_item(_name) {
	switch(_name) {
		case "banana": return new BananaItem();
		case "honeycomb": return new HoneycombItem();
		case "mushroom": return new MushroomItem();
		case "pineapple": return new PineappleItem();
	}
}
