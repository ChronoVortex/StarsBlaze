SINGLETON

G.input_enabled = false;
G.manager.stars_right_to_left();
intro_mus = audio_play_sound(mus_babylon_intro, 10, false);

phase = 0;

menu_scroll_speed = 0.5;

bling_inst = noone;

starfury_inst = noone;
starfury_arrive_speed = 0.007;
starfury_arrive_progress = 0;

starfury_idle_center_x = 0;
starfury_idle_center_y = 0;
starfury_idle_radius = 4;
starfury_idle_angle = 0;
starfury_idle_speed = 4;
starfury_idle_rotations = 3;

starfury_pullback_speed = 0.01;
starfury_pullback_progress = 0;
starfury_pullback_start_x = 0;
starfury_pullback_start_y = 0;
starfury_pullback_end_x = 0;
starfury_pullback_end_y = 0;

show_text = false;
