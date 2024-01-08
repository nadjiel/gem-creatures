/// @description Checking input

// Counting the game frames
global.frame_counter++;

// Checking for input
keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);

// Toggling debug mode
if(keys.f1) debug = !debug;

if(keys.f2) {
	instance_id[1].party_add_follower(instance_id[2]);
	instance_id[2].party_add_follower(instance_id[3]);
	instance_id[3].party_add_follower(instance_id[4]);
	instance_id[4].party_add_follower(instance_id[5]);
}
