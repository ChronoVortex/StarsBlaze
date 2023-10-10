col_shift = (col_shift + col_shift_speed) % 1;
if (!point_in_rectangle(x, y, 0, 0, CANVAS_SIZE, CANVAS_SIZE)) {
    instance_destroy(id, false);
}
