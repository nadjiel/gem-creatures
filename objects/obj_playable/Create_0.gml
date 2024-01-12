/// @description Insert description here

states = {
	walking: new WalkingState(self),
	aiming: new AimingState(self),
	attacking: new AttackingState(self)
};

state = states.walking;
