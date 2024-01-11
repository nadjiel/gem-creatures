/**
 * @desc Constructs a Vector3 that provides some vector operations
 * @param {Real} _x the vector's x coordinate
 * @param {Real} _y the vector's y coordinate
 * @param {Real} _z the vector's z coordinate
 */
function Vector3(_x = 0, _y = 0, _z = 0) : Vector2(_x, _y) constructor {
	
	static super_plus = plus;
	static super_minus = minus;
	static super_equals = equals;
	
	z = _z;
	
	/**
	 * @desc Sums this vector with the passed vector
	 * @param {Struct.Vector3} _vector the vector to sum with
	 */
	static plus = function(_vector) {
		super_plus(_vector);
		
		z += _vector.z;
	}
	
	/**
	 * @desc Subtracts this vector with the passed vector
	 * @param {Struct.Vector3} _vector the vector to subtract with
	 */
	static minus = function(_vector) {
		super_minus(_vector);
		
		z -= _vector.z;
	}
	
	/**
	 * @desc Tells if this vector is equal to the passed vector
	 * @param {Struct.Vector3} _vector a vector to compare to
	 * @returns {Bool} true if the vectors have the same coordinates, false otherwise
	 */
	static equals = function(_vector) {
		return super_equals(_vector) && z == _vector.z;
	}
	
}
