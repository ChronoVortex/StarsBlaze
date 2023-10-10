// Stop intro early
if (input_check_pressed(INPUT.PRIMARY, true)) {
    if (audio_is_playing(intro_mus)) audio_stop_sound(intro_mus);
    audio_play_sound(snd_option_select, 10, false);
    G.manager.stars_top_to_bottom();
    room_goto(room_game);
    instance_destroy();
    exit;
}

// Play intro
switch (phase) {

case 0: // Move option buttons off-screen
    with (obj_option) {
        y += other.menu_scroll_speed;
        if (bbox_top > room_height) instance_destroy();
    }
    if (instance_number(obj_option) <= 0) phase++;
    break;
case 1: // Create bling anim
    bling_inst = instance_create_anim_sprite(path_get_x(pth_intro, 0), path_get_y(pth_intro, 0), layer, spr_bling);
    phase++;
    break;
case 2: // Wait for bling anim to complete
    if (!instance_exists(bling_inst)) phase++;
    break;
case 3: // Create starfury anim
    starfury_inst = instance_create_anim_sprite(path_get_x(pth_intro, 0), path_get_y(pth_intro, 0), layer, spr_starfury_intro, infinity);
    starfury_inst.image_xscale = 0;
    starfury_inst.image_yscale = 0;
    phase++;
    break;
case 4: // Starfury anim phase 1 - arrive
    starfury_arrive_progress = min(1, starfury_arrive_progress + starfury_arrive_speed);
    starfury_inst.x = path_get_x(pth_intro, starfury_arrive_progress);
    starfury_inst.y = path_get_y(pth_intro, starfury_arrive_progress);
    starfury_inst.image_xscale = starfury_arrive_progress;
    starfury_inst.image_yscale = starfury_arrive_progress;
    if (starfury_arrive_progress >= 1) {
        phase++;
            
        // Setup for next phase
        starfury_idle_center_x = starfury_inst.x - starfury_idle_radius;
        starfury_idle_center_y = starfury_inst.y;
    }
    break;
case 5: // Starfury anim phase 2 - idle
    starfury_idle_angle += starfury_idle_speed;
    if (starfury_idle_angle >= 360) {
        starfury_idle_angle = 0;
        starfury_idle_rotations--;
        if (starfury_idle_rotations <= 0) {
            phase++;
            starfury_inst.x = starfury_idle_center_x + starfury_idle_radius;
            starfury_inst.y = starfury_idle_center_y;
            
            // Good luck!
            show_text = true;
            audio_play_sound(snd_good_luck, 10, false);
            
            // Setup for next phase
            starfury_inst.anim_speed *= 2;
            starfury_pullback_start_x = starfury_inst.x;
            starfury_pullback_start_y = starfury_inst.y;
            starfury_pullback_end_x = starfury_inst.x - 15;
            starfury_pullback_end_y = starfury_inst.y;
            break;
        }
    }
    starfury_inst.x = starfury_idle_center_x + lengthdir_x(starfury_idle_radius, starfury_idle_angle);
    starfury_inst.y = starfury_idle_center_y + lengthdir_y(starfury_idle_radius, starfury_idle_angle);
    break;
case 6: // Starfury anim phase 3 - pull back
    starfury_pullback_progress = min(1, starfury_pullback_progress + starfury_pullback_speed);
    starfury_inst.x = easing(pth_ease_out_quad, starfury_pullback_start_x, starfury_pullback_end_x, 1 - starfury_pullback_progress);
    starfury_inst.y = easing(pth_ease_out_quad, starfury_pullback_start_y, starfury_pullback_end_y, 1 - starfury_pullback_progress);
    if (starfury_pullback_progress >= 1) {
        G.manager.stars_top_to_bottom();
        phase++;
    }
    break;
case 7: // Starfury anim phase 4 - accelerate
    starfury_inst.hspeed += 0.08;
    if (starfury_inst.bbox_left > room_width) {
        instance_destroy(starfury_inst);
        show_text = false;
        phase++;
    }
    break;
case 8: // Go to game room
    room_goto(room_game);
    instance_destroy();
    break;

}
