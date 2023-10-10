if (selected) {
    // Perform action
    if (!is_undefined(action) && input_check_pressed(INPUT.PRIMARY)) {
        audio_play_sound(snd_option_select, 10, false);
        action();
    }

    // Select different options
    if (instance_exists(link_top) && input_check_pressed(INPUT.UP)) {
        audio_play_sound(snd_option_change, 10, false);
        link_top.select = true;
        selected = false;
    } else if (instance_exists(link_bottom) && input_check_pressed(INPUT.DOWN)) {
        audio_play_sound(snd_option_change, 10, false);
        link_bottom.select = true;
        selected = false;
    } else if (instance_exists(link_right) && input_check_pressed(INPUT.RIGHT)) {
        audio_play_sound(snd_option_change, 10, false);
        link_right.select = true;
        selected = false;
    } else if (instance_exists(link_left) && input_check_pressed(INPUT.LEFT)) {
        audio_play_sound(snd_option_change, 10, false);
        link_left.select = true;
        selected = false;
    }
}
if (select) {
    select = false;
    selected = true;
}
