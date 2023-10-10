/// @desc        Wrap a number between two values (different from modulo for negetive numbers).
/// @arg {Real}  n    Number to wrap.
/// @arg {Real}  min  Minimum value for wrapping (inclusive).
/// @arg {Real}  max  Maximum value for wrapping (exclusive).
/// @return {Real}
function wrap(n, minimum, maximum) {
	var range = maximum - minimum;
	if (range <= 0) show_error("Maximum is less than or equal to minimum.", true);
	return n - range*floor((n - minimum)/range);
}
