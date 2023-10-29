if (instance_exists(beam)) {
    with (beam) event_perform(ev_draw, ev_draw_normal);
} else if (shoot_timer > 0) {
    draw_sprite_ext(spr_pixel, 0, x, y, 2*CANVAS_SIZE, 1, image_angle, #FC6CA0, lerp(0.6, 0.1, shoot_timer/shoot_timer_start));
}

event_inherited();
