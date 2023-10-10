if (scrolling) {
    with (obj_option) y++;
    scroll_distance--;
    if (scroll_distance <= 0) {
        G.input_enabled = true;
        instance_destroy();
    }
}
