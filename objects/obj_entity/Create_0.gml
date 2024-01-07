/// @description Variable definitions

leader = noone;
follower = noone;
max_party_size = 5;

function count_party_members() {
	var _entity = self;
	var _party_members = 1;
	
	while(_entity.leader) _entity = _entity.leader;
	
	while(_entity.follower) {
		_entity = _entity.follower;
		
		_party_members++;
	}
	
	return _party_members;
}

function add_leader(_leader) {
	var _entity = self;
	
	while(_entity.leader) _entity = _entity.leader;
	
	show_debug_message(count_party_members())
	
	if(count_party_members() >= max_party_size) return;
	
	_entity.leader = _leader;
	_leader.follower = _entity;
}

function add_follower(_follower) {
	var _entity = self;
	
	while(_entity.follower) _entity = _entity.follower;
	
	if(count_party_members() >= max_party_size) return;
	
	_entity.follower = _follower;
	_follower.leader = _entity;
}
