event_inherited();

hp = 8;
hp_max = 8;

points = 170;

beam = noone;
shoot_timer_start = 0;
shoot_timer = 0;
function shoot_beam(_spd, _dir) {
    audio_play_sound(snd_shoot_beam_chargeup, 10, false);
    shoot_timer_start = floor(game_get_speed(gamespeed_fps)*audio_sound_length(snd_shoot_beam_chargeup));
    shoot_timer = shoot_timer_start;
    shoot = false;
}
bullet_shoot = shoot_beam;

aim_radius = 10;
