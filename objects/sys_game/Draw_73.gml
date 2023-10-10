// Life counter
if (respawn_lives_show) {
    draw_set_font(fnt_pixel_5);
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    
    draw_set_halign(fa_right);
    draw_text(lerp(0, respawn_lives_x, respawn_lives_progress), respawn_lives_y, lives_text);
    
    draw_set_halign(fa_left);
    draw_text(lerp(CANVAS_SIZE, respawn_lives_x, respawn_lives_progress), respawn_lives_y, lives_player);
}

// Score
if (score_player > 0 && state != GAME_STATE.GAME_OVER) {
    draw_set_font(fnt_pixel_3);
    draw_set_color(round((lives_score_flash_current/lives_score_flash_interval) % 1) ? c_yellow : c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_text(1, CANVAS_SIZE - 2, score_player);
}

// Game Over
if (state == GAME_STATE.GAME_OVER) {
    draw_set_font(fnt_pixel_5);
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    
    draw_set_halign(fa_right);
    draw_text(lerp(0, game_over_x - 1, game_over_progress), game_over_y, "GAME");
    
    draw_set_halign(fa_left);
    draw_text(lerp(CANVAS_SIZE, game_over_x + 1, game_over_progress), game_over_y, "OVER");
    
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_text_ext(game_over_x, lerp(CANVAS_SIZE, game_over_y + 6, game_over_progress), "SCORE:\n" + string(score_player), 6, CANVAS_SIZE);
}
