/// @description Variable definitions

// Flag that tells if debug mode is on or off
debug = false;

/*var _parent = new Tree();
show_debug_message(_parent.children)
_parent.add_child(new Tree());
show_debug_message(_parent.children)*/

interface = new GUI();
interface.background_sprite = spr_inventory_bg;
interface.border_sprite = spr_inventory_cursor;
interface.set_size(32, 32);
interface.set_right_border(32);
interface.set_left_border(32);
interface.set_top_border(32);
interface.set_bottom_border(32);
interface.set_x_border(16);
interface.set_y_border(16);
interface.set_border(32, 32, 32, 32);
interface.set_right_padding(16);
interface.set_top_padding(16);
interface.set_left_padding(16);
interface.set_bottom_padding(16);
interface.set_x_padding(8);
interface.set_y_padding(8);
interface.set_width(64);
interface.set_height(0);
interface.set_size(96, 96);
interface.set_right_margin(8);
interface.set_top_margin(8);
interface.set_left_margin(8);
interface.set_bottom_margin(8);
interface.set_x_margin(0);
interface.set_y_margin(0);
interface.set_margin(16, 16, 16, 16);
child1 = new GUI();
child2 = new GUI();
show_debug_message(interface.id);
show_debug_message(child1.id);
show_debug_message(child2.id);
//interface.set_margin(8, 8, 8, 8);
//interface.anchor = new FixedGUIAnchor(interface);

show_debug_message(interface)

/*show_debug_message("");
show_debug_message("Parent: {0}", interface);
show_debug_message("Child1: {0}", child1);
show_debug_message("Child2: {0}", child2);
show_debug_message("Child3: {0}", child3);*/
