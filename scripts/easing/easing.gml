/// @desc               With this function you can find the value that equates
///                     to the position in an easing path between two values.
/// @arg {Asset.GMPath} path    The path to use for interpolation.
/// @arg {Real}         value1  The first value.
/// @arg {Real}         value2  The second value.
/// @arg {Real}         amount  The amount to interpolate.
/// @return {Real}
function easing(_path, _value1, _value2, _amount) {
	var _points = path_get_number(_path) - 1;
    
	var _start_y = path_get_point_y(_path, 0);
	var _end_y = path_get_point_y(_path, _points);

	var _y_min = min(_start_y, _end_y);
	var _val_min = min(_value1, _value2);
	var _path_height = abs(_start_y - _end_y);

	return _val_min + abs(_value1 - _value2)*(1 - (path_get_y(_path, _amount) - _y_min)/_path_height);
}
