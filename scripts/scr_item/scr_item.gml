/**
 * @desc Constructor to an item
 */
function Item() constructor {
	
	name = "";
	
	heal = 0;
	
	static use = function() {
		show_debug_message("{0} used!", name);
		if(global.party.leader.hp == global.party.leader.max_hp) return;
		
		global.party.leader.hp = clamp(global.party.leader.hp + heal, 0, global.party.leader.max_hp);
	}
	
	static toString = function() {
		return name;
	}
	
}
