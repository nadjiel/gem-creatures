/// @description Checking input

// Counting the game frames
global.frame_counter++;

// Toggles fullscreen on and off
if(obj_input.keys.esc.press) window_set_fullscreen(!window_get_fullscreen());

if(obj_input.keys.f2.press) { interface.set_width(interface.width + 4); show_debug_message(interface) }
if(obj_input.keys.f3.press) { interface.set_height(interface.height + 4); show_debug_message(interface) }
if(obj_input.keys.f4.press) { interface.anchor.set_left_position(8); show_debug_message(interface) }
if(obj_input.keys.f5.press) { interface.anchor.set_bottom_position(8); show_debug_message(interface) }

/*if(obj_input.keys.f2.hold && mouse_wheel_up()) display_set_gui_size(display_get_gui_width() / 2, display_get_gui_height() / 2);
if(obj_input.keys.f2.hold && mouse_wheel_down()) display_set_gui_size(display_get_gui_width() * 2, display_get_gui_height() * 2);

if(obj_input.keys.f3.hold && mouse_wheel_up()) surface_resize(application_surface, surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2);
if(obj_input.keys.f3.hold && mouse_wheel_down()) surface_resize(application_surface, surface_get_width(application_surface) * 2, surface_get_height(application_surface) * 2);

if(obj_input.keys.f4.hold && mouse_wheel_up()) { view_wport[0] /= 2; view_hport[0] /= 2; }
if(obj_input.keys.f4.hold && mouse_wheel_down()) { view_wport[0] *= 2; view_hport[0] *= 2; }

if(obj_input.keys.f5.hold && mouse_wheel_up()) camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2);
if(obj_input.keys.f5.hold && mouse_wheel_down()) camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) * 2, camera_get_view_height(view_camera[0]) * 2);

if(obj_input.keys.f6.press) global.party.leader.hp -= 7;*/

// Toggling debug mode
if(obj_input.keys.f1.press) debug = !debug;
