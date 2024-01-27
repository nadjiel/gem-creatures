/// @description Inventory management

// Responding to input
if(focused) {
	if(obj_input.keys.enter.press) {
		opened = !opened;
		global.pause = !global.pause;
	}
	
	move_cursor();
}
