/// @description Variable definitions

// Variable that allows this entity to be controllable
controllable = 0;

// Party variables
leader = noone;
follower = noone;
max_party_size = 5;

/**
 * @desc Returns how many members are in this entity's party
 * @returns {Real} an integer corresponding to the amount of entities in the party
 */
function party_count_members() {
	var _entity = self;
	var _party_members = 1;
	
	while(_entity.leader) _entity = _entity.leader;
	
	while(_entity.follower) {
		_entity = _entity.follower;
		
		_party_members++;
	}
	
	return _party_members;
}

/**
 * @desc Tells if the party is full or not
 * @returns {Bool} a boolean indicating if the party is full
 */
function party_is_full() {
	return party_count_members() >= max_party_size;
}

/**
 * @desc Adds an entity as the leader of the party
 * @param {Id.Instance} _leader the instance that will lead the party
 */
function party_add_leader(_leader) {
	var _entity = self;
	
	while(_entity.leader) _entity = _entity.leader;
	
	if(party_is_full()) return;
	
	_entity.leader = _leader;
	_leader.follower = _entity;
	
	show_debug_message(_entity.controllable)
	
	// Passes the controllable from the last leader to the new leader
	if(_entity.controllable) {
		_leader.controllable = _entity.controllable;
		_entity.controllable = 0;
	}
}

/**
 * @desc Adds an entity as the follower of the party
 * @param {Id.Instance} _follower the instance that will follow the party
 */
function party_add_follower(_follower) {
	var _entity = self;
	
	while(_entity.follower) _entity = _entity.follower;
	
	if(party_is_full()) return;
	
	_entity.follower = _follower;
	_follower.leader = _entity;
}
