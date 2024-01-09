/// @description Checking input

// Counting the game frames
global.frame_counter++;

// Checking for input
keys.f1 = keyboard_check_pressed(vk_f1);
keys.f2 = keyboard_check_pressed(vk_f2);
keys.f3 = keyboard_check_pressed(vk_f3);

// Toggling debug mode
if(keys.f1) debug = !debug;
