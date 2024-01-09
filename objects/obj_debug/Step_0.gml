/// @description Checking input

// Counting the game frames
global.frame_counter++;

// Checking for input
keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);
keys.f3 = keyboard_check_pressed(vk_f3);

// Toggling debug mode
if(keys.f1) debug = !debug;

if(keys.f2) {
	instance_id[1].controllable.party.add_follower(instance_id[2])
	instance_id[1].controllable.party.add_follower(instance_id[3])
	instance_id[1].controllable.party.add_follower(instance_id[4])
	instance_id[1].controllable.party.add_follower(instance_id[5])
	instance_id[1].controllable.party.add_follower(instance_id[6])
}

if(keys.f3) {
	show_debug_message(instance_id[1].controllable.party.contains(noone))
}
