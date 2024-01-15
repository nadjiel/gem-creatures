/**
 * @desc Action executable by the hero with the Bow item.
 * @param {Id.Instance} _self the character that has this action
 */
function BowAction(_self) : Action(_self) constructor {
	
	/**
	 * @desc Executes the code of this action itself
	 */
	static exec = function() {
		
	}
	
	static act = function() {
		
	}
	
	static hold = function() {
		actor.state.change(actor.states.aiming);
	}
	
	static release = function() {
		instance_create_layer(
			actor.coord.x + lengthdir_x(TILE_SIZE / 2, actor.facing_dir),
			actor.coord.y + lengthdir_y(TILE_SIZE / 2, actor.facing_dir),
			"Instances",
			obj_arrow,
			{
				creator: actor.id,
				dir: actor.facing_dir
			}
		);
		
		actor.dir = actor.facing_dir;
		actor.state.change(actor.states.walking);
	}
	
}
