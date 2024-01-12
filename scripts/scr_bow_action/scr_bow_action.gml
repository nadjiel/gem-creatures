/**
 * @desc Action executable by the hero with the Bow item
 */
function BowAction() : Action() constructor {
	
	/**
	 * @desc Executes the code of this action itself
	 */
	static exec = function() {
		// TODO: fix bug that makes arrow spawn with dir: 0 by default
		instance_create_layer(
			other.coord.x + lengthdir_x(TILE_SIZE / 2, other.dir),
			other.coord.y + lengthdir_y(TILE_SIZE / 2, other.dir),
			"Instances",
			obj_arrow,
			{
				creator: other.id,
				dir: other.dir
			}
		);
	}
	
}
