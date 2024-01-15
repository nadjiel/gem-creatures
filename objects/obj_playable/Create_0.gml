/// @description Insert description here

states = {
	walking: new WalkingState(self),
	attacking: new AttackingState(self)
};

state = states.walking;
