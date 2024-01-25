/// @description Inventory management

// Input gathering
keys.enter = keyboard_check_pressed(vk_enter);
keys.confirm = mouse_check_button_pressed(mb_left);

// Responding to input
if(focused) {
	if(keys.enter) {
		opened = !opened;
		global.pause = !global.pause;
	}
	
	move_cursor();
}
