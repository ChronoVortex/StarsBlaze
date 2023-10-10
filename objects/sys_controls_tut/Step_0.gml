if (input_check_pressed(INPUT.PRIMARY)) {
    audio_play_sound(snd_option_select, 10, false);
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        room_goto(room_menu);
    } else {
        image_index++;
    }
}
