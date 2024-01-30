/**
 * @desc Constructor representing a tree data structure node that has references to its children and its parent
 */
function Tree() constructor {
	
	parent = 0;
	children = [];
	
	/**
	 * @desc Adds a new child to this node and updates its parent
	 * @param {Struct.Tree} _child the child node to add
	 */
	static add_child = function(_child) {
		array_push(children, _child);
		
		_child.parent = self;
	}
	
}
