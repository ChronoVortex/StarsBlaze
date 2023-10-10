// Aim at player and fire
if (shoot && instance_exists(G.player) && G.input_enabled && point_in_rectangle(x, y, 0, 0, CANVAS_SIZE, CANVAS_SIZE)) {
    if (is_struct(aim_current)) {
        var _dir_to_target = point_direction(x, y, aim_current.x, aim_current.y);
        var _diff = angle_difference(_dir_to_target, image_angle);
        if (abs(_diff) <= aim_speed_current) {
            // Fire
            image_angle = _dir_to_target;
            audio_play_sound(snd_shoot_enemy, 10, false);
            bullet_shoot(bullet_speed, _dir_to_target);
            aim_current = -1;
        } else {
            // Turn towards target
            image_angle += sign(_diff)*aim_speed_current;
        }
    } else {
        aim_wait_current--;
        if (aim_wait_current <= 0) {
            aim_current = random_point_radius(G.player.x, G.player.y, aim_radius);
            aim_speed_current = random_range(aim_speed_min, aim_speed_max);
            var _enemies = instance_number(obj_enemy);
            var _wait_min = aim_wait_min + _enemies*aim_wait_min_inc;
            var _wait_max = aim_wait_max + _enemies*aim_wait_max_inc;
            aim_wait_current = random_range(_wait_min, _wait_max);
        }
    }
}
