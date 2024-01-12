/// @description Variable declarations

event_inherited();

// Making this player be controllable by default
controller = new Controller(self);

// Assigning this player to be party leader by default
global.party = new Party(self);

// Declaring some default actions for the hero
// TODO: make them only doable with their items
actions[0] = new BowAction();
