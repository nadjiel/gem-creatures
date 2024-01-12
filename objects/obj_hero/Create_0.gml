/// @description Variable declarations

event_inherited();

// Making this player be controllable by default
controllable = new Controllable();

// Assigning this player to be party leader by default
global.party = new Party(self);

// Declaring some default actions for the hero
// These should be later doable only with their items
actions[0] = new BowAction();
