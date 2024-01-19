/// @description Checking input

// Counting the game frames
global.frame_counter++;

// Checking for input
keys.esc = keyboard_check_pressed(vk_escape);
keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check(vk_f2);
keys.f3 = keyboard_check(vk_f3);
keys.f4 = keyboard_check(vk_f4);
keys.f5 = keyboard_check(vk_f5);

// Toggles fullscreen on and off
if(keys.esc) window_set_fullscreen(!window_get_fullscreen());

if(keys.f2 && mouse_wheel_up()) display_set_gui_size(display_get_gui_width() / 2, display_get_gui_height() / 2);
if(keys.f2 && mouse_wheel_down()) display_set_gui_size(display_get_gui_width() * 2, display_get_gui_height() * 2);

if(keys.f3 && mouse_wheel_up()) surface_resize(application_surface, surface_get_width(application_surface) / 2, surface_get_height(application_surface) / 2);
if(keys.f3 && mouse_wheel_down()) surface_resize(application_surface, surface_get_width(application_surface) * 2, surface_get_height(application_surface) * 2);

if(keys.f4 && mouse_wheel_up()) { view_wport[0] /= 2; view_hport[0] /= 2; }
if(keys.f4 && mouse_wheel_down()) { view_wport[0] *= 2; view_hport[0] *= 2; }

if(keys.f5 && mouse_wheel_up()) camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2);
if(keys.f5 && mouse_wheel_down()) camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) * 2, camera_get_view_height(view_camera[0]) * 2);

// Toggling debug mode
if(keys.f1) debug = !debug;
