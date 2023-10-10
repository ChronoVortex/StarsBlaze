/// @desc          Set the value of the given shader constant for the current shader.
/// @arg {String}  uniform   The name of the shader constant to set.
/// @arg {Real}    value1    The floating point value to set the shader constant to.
/// @arg {Real}    [value2]  The floating point value to set the shader constant to.
/// @arg {Real}    [value3]  The floating point value to set the shader constant to.
/// @arg {Real}    [value4]  The floating point value to set the shader constant to.
function shader_uniform_f() {
	var _args = array_create(argument_count - 1);
	for (var i = 1; i < argument_count; i++) _args[i - 1] = argument[i];
	shader_set_uniform_f_array(shader_get_uniform(shader_current(), argument[0]), _args);
}
