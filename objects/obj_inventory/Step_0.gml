/// @description Inventory management

keys.enter = keyboard_check_pressed(vk_enter);

if(keys.enter) {
	opened = !opened;
	global.pause = !global.pause;
}

move_cursor();
