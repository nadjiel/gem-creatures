/// @description Variable definitions

// Flag that tells if debug mode is on or off
debug = false;

/*var _parent = new Tree();
show_debug_message(_parent.children)
_parent.add_child(new Tree());
show_debug_message(_parent.children)*/

interface = new GUI();
child = new GUI();

interface.background_sprite = spr_inventory_bg;
interface.border_sprite = spr_inventory_cursor;
child.background_sprite = spr_bg;
child.border_sprite = spr_inventory_cursor;

interface.set_border(8, 8, 8, 8);
interface.set_padding(8, 8, 8, 8);
child.set_size(16, 16);

interface.add_child(child);
child.anchor = new FixedGUIAnchor(child); 
show_debug_message(child);

/*show_debug_message("");
show_debug_message("Parent: {0}", interface);
show_debug_message("Child1: {0}", child1);
show_debug_message("Child2: {0}", child2);
show_debug_message("Child3: {0}", child3);*/
