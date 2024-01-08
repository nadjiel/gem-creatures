/// @description Variable definitions

// TODO: Complete party_swap_leader method
// TODO: Think of a better place to put the party code

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
 * @desc Finds the member of the party that corresponds to the passed position
 * @param {Real} _position the position of the member to find (has to be from 1 to the party size)
 * @returns {Id.Instance} the entity in the passed position, or noone if there aren't any
 */
function party_find_by_position(_position) {
	if(_position < 1 || _position > party_count_members()) return noone;
	
	var _entity = self;
	
	while(_entity.leader) _entity = _entity.leader;
	
	var _current_position = 1;
	
	while(_current_position != _position) {
		_entity = _entity.follower;
		
		_current_position++;
	}
	
	show_debug_message(_entity.id)
	
	return _entity;
}

/**
 * @desc Adds an entity as the leader of the party, this instance gets the controllable from the former leader
 * @param {Id.Instance} _leader the instance that will lead the party
 */
function party_add_leader(_leader) {
	var _entity = self;
	
	while(_entity.leader) _entity = _entity.leader;
	
	if(party_is_full()) return;
	
	_entity.leader = _leader;
	_leader.follower = _entity;
	
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

/**
 * @desc Removes a member from the party
 * @param {Id.Instance} _member the instance to remove from te party,
 *     if it's the leader, it's controllable will be passed to its follower
 */
function party_remove_member(_member = self) {
	var _follower = _member.follower;
	var _leader = _member.leader;
	
	_member.follower = noone;
	_member.leader = noone;
	
	if(_follower) _follower.leader = _leader;
	if(_leader) {
		_leader.follower = _follower;
	} else {
		_follower.controllable = _member.controllable;
		_member.controllable = 0;
	}
}

function party_swap_leader(_new_leader_position) {
	var _new_leader = party_find_by_position(_new_leader_position);
	
	if(!_new_leader) return;
	
	party_remove_member(_new_leader);
	party_add_leader(_new_leader);
}
