/// @description Drawing debug info

// Showing information about game size
if(debug) {
	show_game_size_info();
}

default_interface.draw(-1);

if(test == 1) {
	test++;
	
	var _surface = surface_create(16, 16);
	
	show_debug_message("Target surface: {0}", surface_get_target())
	show_debug_message("Application surface: {0}", application_surface)
	show_debug_message("Surface: {0}", _surface)
	show_debug_message("\n*Target surface set*\n")
	surface_set_target(_surface)
	show_debug_message("Target surface: {0}", surface_get_target())
	show_debug_message("Target surface == surface: {0}", surface_get_target() == _surface)
	show_debug_message("\n*Target surface reset*\n")
	surface_reset_target()
	show_debug_message("Target surface: {0}", surface_get_target())
	show_debug_message("Surface exists: {0}", surface_exists(_surface))
	show_debug_message("\n*Surface freed*\n")
	surface_free(_surface)
	show_debug_message("Freed surface: {0}", _surface)
	show_debug_message("Freed surface exists: {0}", surface_exists(_surface))
	show_debug_message("Target surface == application surface: {0}", surface_get_target() == application_surface)
	show_debug_message("Target surface == -1: {0}", surface_get_target() == -1)
}
