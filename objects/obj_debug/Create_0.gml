/// @description Variable definitions

// Flag that tells if debug mode is on or off
debug = false;

/*var _parent = new Tree();
show_debug_message(_parent.children)
_parent.add_child(new Tree());
show_debug_message(_parent.children)*/

interface = new GUI();
child1 = new GUI();
child2 = new GUI();
child3 = new GUI();
grandchild1 = new GUI();

interface.background_sprite = spr_inventory_bg;
interface.border_sprite = spr_inventory_cursor;
child1.background_sprite = spr_bg;
child1.border_sprite = spr_inventory_cursor;
child2.background_sprite = spr_bg;
child2.border_sprite = spr_inventory_cursor;
child3.background_sprite = spr_bg;
child3.border_sprite = spr_inventory_cursor;
grandchild1.background_sprite = spr_pineapple;
grandchild1.border_sprite = spr_inventory_cursor;

interface.set_border(8, 8, 8, 8);
interface.set_padding(8, 8, 8, 8);
interface.set_margin(16, 16, 16, 16);
child1.set_size(16, 16);
child1.set_bottom_margin(8);
child2.set_size(32, 32);
child2.set_border(8, 8, 8, 8);
child2.set_bottom_margin(8);
child3.set_size(8, 8);
grandchild1.set_size(4, 4);

interface.add_child(child1);
interface.add_child(child2);
interface.add_child(child3);
child1.add_child(grandchild1);

interface.overflow = "hidden";
interface.fit_children();
interface.update_position();

show_debug_message(interface);
show_debug_message(child1);
show_debug_message(child2);
show_debug_message(child3);

test = 1;

/*show_debug_message("");
show_debug_message("Parent: {0}", interface);
show_debug_message("Child1: {0}", child1);
show_debug_message("Child2: {0}", child2);
show_debug_message("Child3: {0}", child3);*/
