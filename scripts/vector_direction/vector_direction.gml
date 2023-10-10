/// @desc                Calculate the direction of a vector given its x and y components.
/// @arg {Real} vectorx  The x component of the vector.
/// @arg {Real} vectory  The y component of the vector.
/// @return {Real}
function vector_direction(vectorx, vectory) {
	gml_pragma("forceinline");
	return wrap(darctan2(-vectory, vectorx), 0, 360);
}
