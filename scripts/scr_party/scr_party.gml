/**
 * @desc Constructor to a party struct. Note that the party is always held by the controllable
 *     and the controllable is always held by the party leader.
 */
function Party(_leader) constructor {
	
	// Variable defining the maximum size of the party
	static max_size = 5;
	
	// Variable containing the leader of the party
	leader = _leader;

	/**
	 * @desc Returns how many members are in this party
	 * @returns {Real} an integer corresponding to the amount of entities in the party
	 */
	static count_members = function() {
		var _member = leader;
		var _members_amount = 1;
	
		while(_member.follower) {
			_member = _member.follower;
		
			_members_amount++;
		}
	
		return _members_amount;
	}

	/**
	 * @desc Tells if the party is full or not
	 * @returns {Bool} a boolean indicating if the party is full
	 */
	static is_full = function() {
		return count_members() >= max_size;
	}

	/**
	 * @desc Finds the member of the party that corresponds to the passed position, or noone, if any is found
	 * @param {Real} _position the position of the member to find (should be from 0 to the party size - 1).
	 *     The value received here is rounded in case it isn't an integer as expected
	 * @returns {Id.Instance} the entity in the passed position, or noone if there aren't any
	 */
	static find_by_position = function(_position) {
		_position = round(_position);
		if(_position < 0 || _position >= count_members()) return noone;
	
		var _member = leader;
	
		var _current_position = 0;
	
		while(_current_position != _position) {
			_member = _member.follower;
		
			_current_position++;
		}
	
		return _member;
	}
	
	/**
	 * @desc Finds the position corresponding to the passed member, or -1, if the member isn't in the party
	 * @param {Id.Instance} _searched_member the member of whom to find the position.
	 *     If noone, -1 is returned
	 * @returns {Real} a number corresponding to the position of the member in the party,
	 *     or -1, if the instance isn't a party member
	 */
	static find_position = function(_searched_member) {
		var _searched_position = -1;
		
		if(_searched_member == noone) return _searched_position;
		
		var _member = leader;
		var _current_position = 0;
		var _members_amount = count_members();
		
		while(_current_position < _members_amount) {
			if(_searched_member.id == _member.id) {
				_searched_position = _current_position;
				break;
			}
			
			_member = _member.follower;
			_current_position++;
		}
		
		return _searched_position;
	}
	
	/**
	 * @desc Tells if the passed instance is a member of the party
	 * @param {Id.Instance} _member the instance you want to find out if is a party member
	 * @returns {Bool} boolean indicating if the received instance is a party member
	 */
	static contains = function(_member) {
		return find_position(_member) != -1;
	}

	/**
	 * @desc Adds a new leader to the party, if it isn't full.
	 *     The new leader gets the controllable from the former leader
	 * @param {Id.Instance} _new_leader the member that will lead the party
	 */
	static add_leader = function(_new_leader) {
		if(_new_leader == noone) return;
		if(is_full()) return;
		
		var _former_leader = leader;
		
		// Saves the new leader in this party
		leader = _new_leader;
		
		// Adjusting pointers from former and new leaders
		_former_leader.leader = _new_leader;
		_new_leader.follower = _former_leader;
	
		// Passes the controllable from the former leader to the new leader
		_new_leader.controllable = _former_leader.controllable;
		_former_leader.controllable = 0;
	}

	/**
	 * @desc Adds a new follower to the party, if it isn't full
	 * @param {Id.Instance} _new_follower the member that will follow the party
	 */
	static add_follower = function(_new_follower) {
		if(_new_follower == noone) return;
		if(is_full()) return;
		
		var _member = leader;
	
		while(_member.follower) _member = _member.follower;
		
		var _former_follower = _member;
	
		// Adjusting pointers from former and new last followers
		_former_follower.follower = _new_follower;
		_new_follower.leader = _former_follower;
	}
	
	/**
	 * @desc Adds a new member to the party, if it isn't full, at the specified position.
	 *     If none is provided, than this method behaves as the add_leader method
	 * @param {Id.Instance} _new_member the new member that will enter the party
	 * @param {Real} _position the position on which to add the member (should be from 0 to the party size).
	 *     The value received here is rounded in case it isn't an integer as expected.
	 *     If no value is passed, it defaults to 0
	 */
	static add_member = function(_new_member, _position = 0) {
		if(_new_member == noone) return;
		
		// How many members are in the party
		var _members_amount = count_members();
		
		if(_members_amount >= max_size) return;
		
		_position = round(_position);
		if(_position < 0 || _position > _members_amount) return noone;
		
		if(_position == 0) return add_leader(_new_member);
		if(_position == _members_amount) return add_follower(_new_member);
		
		// The member that used to occupy the desired position
		var _old_member = find_by_position(_position);
		// The leader of the member that used to occupy the desired position
		var _old_member_leader = _old_member.leader;
		
		// Adjusting pointers from the old member and the new one
		_old_member.leader = _new_member;
		_new_member.follower = _old_member;
		
		// Adjusting pointers from the new member and the leader of the old one
		_new_member.leader = _old_member_leader;
		_old_member_leader.follower = _new_member;
	}

	/**
	 * @desc Removes the leader of the party and passes the leadership to its direct follower
	 *     if the party has more than one members.
	 *     Also returns the removed leader or noone, if no remotion occurred.
	 *     The new leader gets the controllable from the former leader
	 * @returns {Id.Instance} the former leader of the party or noone,
	 *     if the remotion hasn't succeded
	 */
	static remove_leader = function() {
		if(count_members() == 1) return noone;
		
		var _former_leader = leader;
		
		// Saves the new leader in this party
		leader = _former_leader.follower;
		
		var _new_leader = leader;
		
		// Adjusting pointers from former and new leaders
		_former_leader.follower = noone;
		_new_leader.leader = noone;
	
		// Passes the controllable from the former leader to the new leader
		_new_leader.controllable = _former_leader.controllable;
		_former_leader.controllable = 0;
		
		return _former_leader;
	}
	
	/**
	 * @desc Removes the follower of the party if the party has more than one members.
	 *     Also returns the removed follower or noone, if no remotion occurred
	 * @returns {Id.Instance} the former follower of the party or noone,
	 *     if the remotion hasn't succeded
	 */
	static remove_follower = function() {
		if(count_members() == 1) return noone;
		
		var _member = leader;
	
		while(_member.follower) _member = _member.follower;
		
		var _former_follower = _member;
		var _new_follower = _former_follower.leader;
	
		// Adjusting pointers from former and new last followers
		_former_follower.leader = noone;
		_new_follower.follower = noone;
		
		return _former_follower;
	}
	
	/**
	 * @desc Removes a member of the party, if it has more than one members, at the specified position.
	 *     If none is provided, than this method behaves as the remove_leader method
	 * @param {Real} _position the position from which to remove the member (should be from 0 to the party size - 1).
	 *     The value received here is rounded in case it isn't an integer as expected.
	 *     If no value is passed, it defaults to 0
	 */
	static remove_member = function(_position = 0) {
		// How many members are in the party
		var _members_amount = count_members();
		
		if(_members_amount == 1) return noone;
		
		_position = round(_position);
		if(_position < 0 || _position >= _members_amount) return noone;
		
		if(_position == 0) return remove_leader();
		if(_position == _members_amount - 1) return remove_follower();
		
		// The member that used to occupy the desired position
		var _old_member = find_by_position(_position);
		// The follower of the member that used to occupy the desired position
		var _old_member_follower = _old_member.follower;
		// The leader of the member that used to occupy the desired position
		var _old_member_leader = _old_member.leader;
		
		// Adjusting pointers from the old member
		_old_member.follower = noone;
		_old_member.leader = noone;
		
		// Adjusting pointers from the old member's follower and leader
		_old_member_follower.leader = _old_member_leader;
		_old_member_leader.follower = _old_member_follower;
		
		return _old_member;
	}

	/**
	 * @desc Swaps the position of the current leader with a new leader chosen by the passed position
	 * @param {Real} _new_leader_position the position of the new leader of the party, from 1 to the party size - 1.
	 *     If the value is 0 nothing happens since that's already the position of the current leader.
	 *     And if the value is greater than the party size - 1, nothing happens either,
	 *     because there's no one there to assume the post
	 */
	static swap_leader = function(_new_leader_position) {
		if(_new_leader_position == 0) return;
		
		var _new_leader = remove_member(_new_leader_position);
		
		if(_new_leader == noone) return;
		
		var _old_leader = remove_leader();
		
		add_leader(_new_leader);
		
		add_member(_old_leader, _new_leader_position);
	}
	
}
