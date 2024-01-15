/// @description User control

event_inherited();

// Allows the user to control this playable character, if it is controllable in the moment
if(controller) controller.step();
