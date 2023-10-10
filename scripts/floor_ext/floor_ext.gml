/// @desc        Round a given number down to the nearest multiple of a given factor.
/// @arg {Real}  n       The number to round.
/// @arg {Real}  factor  The factor to round to the nearest multiple of.
/// @return {Real}
function floor_ext(n, factor) {
	gml_pragma("forceinline");
	return floor(n/factor)*factor;
}
