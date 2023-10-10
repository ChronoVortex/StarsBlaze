/// @desc        Select a random element from an array.
/// @arg {Array} array  The array to select from.
/// @return {Any}
function array_choose(_array) {
    gml_pragma("forceinline");
    return _array[irandom(array_length(_array) - 1)];
}
