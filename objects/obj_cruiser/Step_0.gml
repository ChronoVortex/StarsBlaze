// Fly up and down in a sine wave pattern
y = sine_amp*sin(G.current_frame*sine_spd) + start_y;

// Adjust sound volume
if (flight_sound_control_gain) {
    var _half_spr_w = sprite_get_width(sprite_index)/2;
    if (x < 0) {
        audio_sound_gain(flight_sound, max(0, 1 + x/_half_spr_w), 0);
    } else if (x > CANVAS_SIZE) {
        audio_sound_gain(flight_sound, max(0, 1 - (x - CANVAS_SIZE)/_half_spr_w), 0);
    } else {
        audio_sound_gain(flight_sound, 1, 0);
    }
}

// Destroy if offscreen
var _moving_right = hspeed > 0;
if ((_moving_right && bbox_left > CANVAS_SIZE) || (!_moving_right && bbox_right < 0))
    instance_destroy(id, false);
