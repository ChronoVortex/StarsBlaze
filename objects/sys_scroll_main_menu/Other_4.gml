if (room == room_menu) {
    var _dist = 0;
    with (obj_option) if (bbox_bottom > _dist) _dist = bbox_bottom;
    with (obj_option) y -= _dist;
    scroll_distance = _dist;
    scrolling = true;
} else {
    instance_destroy();
}
