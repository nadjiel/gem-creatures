/**
 * @desc Constructor representing a tree data structure node that has references to its children and its parent
 */
function Tree() constructor {
	
	/// Counter variable to determine the node's id
	static counter = 0;
	
	id = counter++;
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
	
	/**
	 * @desc Returns the node identified by the passed id, or -1 if none exist
	 * @param {Real} _id the id of the node to look for
	 * @returns {Real | Struct.Tree} the node identified by the received id
	 */
	static get_node = function(_id) {
		if(_id == id) return self;
		
		var _children_amount = array_length(children);
		
		if(_children_amount == 0) return -1;
		
		for(var _i = 0; _i < _children_amount; _i++) {
			var _node = children[_i].get_node(_id);
			if(_node != -1) return _node;
		}
		
		return -1;
	}
	
	/**
	 * @desc Returns the descendent node identified by the passed id, or -1 if none exist
	 * @param {Real} _id the id of the descendent to look for
	 * @returns {Real | Struct.Tree} the descendent identified by the received id
	 */
	static get_descendent = function(_id) {
		if(_id == id) return -1;
		
		return get_node(_id);
	}
	
	/**
	 * @desc Returns the passed child's index, if it is a direct child of this node
	 * @param {Struct.Tree} _child a tree node to find the index of
	 * @returns {Real} the index of the received child
	 */
	static get_child_index = function(_child) {
		var _children_amount = array_length(children);
		for(var _i = 0; _i < _children_amount; _i++) {
			if(_child.id == children[_i].id) return _i;
		}
		
		return -1;
	}
	
	/**
	 * @desc Removes a descendent identified by the passed id from the tree hierarchy if found
	 * @param {Real} _id the id of the descendent to be removed
	 * @returns {Bool | Struct.Tree} the removed descendent or false, if no one was removed
	 */
	static remove_descendent = function(_id) {
		var _descendent = get_descendent(_id);
		
		if(_descendent == -1) return false;
		
		var _node_parent = _descendent.parent;
		var _node_index = _node_parent.get_child_index(_descendent);
		
		array_delete(_node_parent.children, _node_index, 1);
		
		return _descendent;
	}
	
}
