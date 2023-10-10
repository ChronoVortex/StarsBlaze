event_inherited();

if (shoot_timer > 0) {
    shoot_timer--;
    if (shoot_timer <= 0) {
        audio_play_sound(snd_shoot_beam, 10, false);
        beam = instance_create_layer(x, y, layer, obj_bullet_beam);
        beam.image_xscale = 2*CANVAS_SIZE;
        beam.image_angle = image_angle;
        shoot = true;
    }
}

if (instance_exists(beam)) {
    beam.x = x;
    beam.y = y;
}
