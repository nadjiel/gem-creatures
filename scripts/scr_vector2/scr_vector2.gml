/**
 * @desc Constructs a Vector2 that provides some vector operations
 */
function Vector2(_x = 0, _y = 0) constructor {
	x = _x;
	y = _y;
	
	/**
	 * @desc Subtracts this vector with the passed vector
	 * @param {Struct.Vector2} _vector the vector to subtract with
	 * @returns {Struct.Vector2} a vector resultant of the subtraction
	 */
	static subtract = function(_vector) {
		return new Vector2(x - _vector.x, y - _vector.y);
	}
	
	/**
	 * @desc Tells if this vector is equal to the passed vector
	 * @param {Struct.Vector2} _vector a vector to compare to
	 * @returns {Bool} true if the vectors have the same coordinates, false otherwise
	 */
	static equals = function(_vector) {
		return x == _vector.x && y == _vector.y;
	}
	
	/**
	 * @desc Tells if the this vector is less than or equal to the passed vector taking the provided direction into account
	 * @param {Struct.Vector2} _vector the vector to compare to
	 * @param {Real} _direction the angle to take into account when comparing the vectors
	 * @returns {Bool} true, if this vector is less or equal than the received vetor in the received direction
	 */
	static is_less_than_or_equal = function(_vector, _direction) {
		var _dvector = _vector.subtract(self);
		
		var _x_direction = sign(lengthdir_x(abs(_dvector.x), _direction));
		var _y_direction = sign(lengthdir_y(abs(_dvector.y), _direction));
		
		return (sign(_dvector.x) == _x_direction) && (sign(_dvector.y) == _y_direction);
	}
	
}
