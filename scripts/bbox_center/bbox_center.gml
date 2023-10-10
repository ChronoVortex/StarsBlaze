/// @desc              Find the center of an instance's bounding box in the room.
/// @arg {Id.Instance} instance  The instance to get the center of.
/// @return {Struct.Point}
function bbox_center(_o = id) {
	gml_pragma("forceinline");
    return new Point(_o.bbox_left + (_o.bbox_right - _o.bbox_left)/2, _o.bbox_top + (_o.bbox_bottom - _o.bbox_top)/2);
}
