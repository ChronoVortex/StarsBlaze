event_inherited();

text = "EXIT";
action = function() {
    selected = false;
    G.input_enabled = false;
    var _select_sound_frames = ceil(game_get_speed(gamespeed_fps)*audio_sound_length(snd_option_select));
    call_later(_select_sound_frames, time_source_units_frames, function() {
        game_end();
    });
};
