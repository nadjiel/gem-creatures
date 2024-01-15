/**
 * @desc Action executable by the hero with the Bow item.
 * @param {Id.Instance} _actor the character that has this action
 */
function BowAction(_actor) : Action(_actor) constructor {
	
	// Miliseconds to wait until actor starts charging
	static charge_delay = seconds_to_miliseconds(0.5);
	// Time required for a full charge
	static max_charge_time = seconds_to_miliseconds(1);
	// Maximum angle for the extra arrows in the charged action
	static extra_arrows_max_angle = 45;
	
	// Time when the charge started
	charge_start = 0;
	// Current amount of charging time
	charge_time = 0;
	// Angle to apply to the extra arrows in the charged action
	extra_arrows_angle = 0;
	
	/**
	 * @desc Fires an arrow with the additional passed angle
	 * @param {Real} _angle angle to add to the arrow (defaults to 0)
	 */
	static fire = function(_angle = 0) {
		instance_create_layer(
			actor.coord.x + lengthdir_x(TILE_SIZE / 2, actor.facing_dir),
			actor.coord.y + lengthdir_y(TILE_SIZE / 2, actor.facing_dir),
			"Instances",
			obj_arrow,
			{
				creator: actor.id,
				dir: _angle
			}
		);
	}
	
	/**
	 * @desc The start behavior of this action
	 */
	static act = function() {
		// Defaults to no extra arrows
		extra_arrows_angle = 0;
		
		// Marks the start time of the charging
		charge_start = current_time;
	}
	
	/**
	 * @desc This action's code for every step
	 */
	static charge = function() {
		// Executes the code only if the charge delay has passed
		if(!(current_time - charge_start >= charge_delay)) return;
		
		// Sets the actor to aim
		actor.aiming = true;
		
		// Calculates how much time the charging has taken
		charge_time = current_time - charge_start - charge_delay;
		if(charge_time >= max_charge_time) charge_time = max_charge_time;
		
		// Calculates the angle of the extra arrows
		extra_arrows_angle = extra_arrows_max_angle * charge_time / max_charge_time;
	}
	
	/**
	 * @desc The code of this action on release
	 */
	static release = function() {
		// Fires the arrow(s)
		fire(actor.facing_dir);
		if(extra_arrows_angle > 0) {
			fire(actor.facing_dir - extra_arrows_angle);
			fire(actor.facing_dir + extra_arrows_angle);
		}
		
		// Fixes the actor direction to its facing direction
		actor.dir = actor.facing_dir;
		// Makes the actor stop aiming
		actor.aiming = false;
	}
	
}
