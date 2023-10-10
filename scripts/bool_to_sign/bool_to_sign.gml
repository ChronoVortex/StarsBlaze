/// @desc       Return 1 if true, -1 if false.
/// @arg {Bool} bool  The bool to convert to a sign.
/// @return {Real}
function bool_to_sign(_bool) {
	gml_pragma("forceinline");
	return 2*_bool - 1;
}
