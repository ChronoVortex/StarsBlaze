event_inherited();

// Destroy if health is depleted
if (hp <= 0) instance_destroy();

// Movement behavior
switch (state) {

case ENEMY_STATE.ARRIVE:
    if (path_exists(arrive_path)) {
        arrive_progress = min(1, arrive_progress + arrive_speed);
        var _progress = easing(pth_ease_in_quad, 0, 1, arrive_progress);
        x = path_get_x(arrive_path, _progress);
        y = path_get_y(arrive_path, _progress);
        if (arrive_progress >= 1) state = ENEMY_STATE.IDLE;
    }
    break;

}
