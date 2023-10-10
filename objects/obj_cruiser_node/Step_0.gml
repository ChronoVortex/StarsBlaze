event_inherited();

if (instance_exists(cruiser)) {
    x = cruiser.x + offset_x;
    y = cruiser.y + offset_y;
} else {
    instance_destroy(id, false);
}
