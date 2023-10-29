if (lives_score_flash_current > 0) lives_score_flash_current--;

switch (state) {

#region Playing
case GAME_STATE.PLAYING:
    #region Gameplay driver
    if (instance_exists(obj_starfury)) {
        // Spawn cruisers
        if (!instance_exists(obj_cruiser)) cruiser_timer--;
        if (cruiser_timer <= 0) {
            cruiser_timer = random_range(900, 1200);
            var _move_right = irandom(1);
            var _cruiser = instance_create_layer(-CANVAS_SIZE*2, y, "Cruisers", obj_cruiser);
            var _half_cruiser_width = sprite_get_width(_cruiser.sprite_index)/2;
            _cruiser.cruiser_init(_move_right);
            _cruiser.x = _move_right ? -_half_cruiser_width : CANVAS_SIZE + _half_cruiser_width;
        }
        
        // Award extra lives
        if (score_player >= lives_score_current) {
            audio_play_sound(snd_lifeup, 10, false);
            lives_score_current += lives_score_interval;
            lives_score_flash_current = lives_score_flash;
            lives_player++;
        }
        
        switch (state_play) {
        
        case PLAY_STATE.ARRIVE: // Spawn enemies
            var _arrival_complete = true;
            for (var i = 0; i < array_length(enemy_formations_current); ++i) {
                var _formation = enemy_formations_current[i];
                var _status = formation_check_arrive_status(_formation);
                if (_status > ARRIVE_STATUS.ARRIVED) {
                    if (_status == ARRIVE_STATUS.SPAWN) {
                        array_foreach(_formation, function(_enemy) {
                            var _x = path_get_x(_enemy.path, 0);
                            var _y = path_get_y(_enemy.path, 0);
                            _enemy.inst = instance_create_layer(_x, _y, "Instances", _enemy.type);
                            _enemy.inst.arrive_path = _enemy.path;
                            _enemy.inst.image_angle = point_direction(_x, _y, path_get_x(_enemy.path, 0.01), path_get_y(_enemy.path, 0.01));
                            _enemy.inst.scale_difficulty(round_current/round_difficulty_scale);
                        });
                    }
                    _arrival_complete = false;
                    break;
                }
            }
            if (_arrival_complete) state_play = PLAY_STATE.ASSAULT;
            break;
        case PLAY_STATE.ASSAULT:
            if (instance_exists(obj_enemy)) { // Make enemies attack the player
                // TODO: make enemies assault the player
            } else { // No enemies left, start spawning them again
                if (round_current >= enemy_hard_theshhold) {
                    formations_set(enemy_formations_hard_1, enemy_formations_hard_2);
                } else if (round_current >= enemy_medium_theshhold) {
                    if (round_current % enemy_elite_interval == enemy_elite_interval - 1) {
                        formations_set(enemy_formations_medium_elite_1, enemy_formations_medium_elite_1);
                    } else {
                        formations_set(enemy_formations_medium_1, enemy_formations_medium_2);
                    }
                } else {
                    if (round_current % enemy_elite_interval == enemy_elite_interval - 1) {
                        formations_set(enemy_formations_easy_elite_1, enemy_formations_easy_elite_1);
                    } else {
                        formations_set(enemy_formations_easy_1, enemy_formations_easy_2);
                    }
                }
                state_play = PLAY_STATE.ARRIVE;
                round_current++;
            }
            break;
        
        }
    #endregion
    #region Player has died
    } else {
        G.input_enabled = false;
        lives_player--;
        state = lives_player < 0 ? GAME_STATE.GAME_OVER : GAME_STATE.DYING;
    }
    #endregion
    break;
#endregion

#region Dying
case GAME_STATE.DYING:
    if (dying_wait_current >= dying_wait) {
        dying_wait_current = 0;
        state = GAME_STATE.RESPAWN;
    } else {
        dying_wait_current++;
    }
    break;
#endregion

#region Respwn
case GAME_STATE.RESPAWN:
    switch (respawn_phase) {
    
    case 0: // Create player
        player = instance_create_layer(respawn_start.x, respawn_start.y, zone_player.layer, obj_starfury);
        respawn_phase++;
        break;
    case 1: // Move player into its zone
        respawn_arrive_progress = min(1, respawn_arrive_progress + respawn_arrive_speed);
        player.x = easing(pth_ease_out_quad, respawn_start.x, zone_player_center.x, 1 - respawn_arrive_progress);
        player.y = easing(pth_ease_out_quad, respawn_start.y, zone_player_center.y, 1 - respawn_arrive_progress);
        if (respawn_arrive_progress >= 1) {
            respawn_phase++;
            respawn_arrive_progress = 0;
            player.zone = zone_player;
            
            // Setup for next phase
            respawn_lives_show = true;
            draw_set_font(fnt_pixel_5);
            var _ltw = string_width(lives_text);
            var _lcw = string_width(lives_player);
            respawn_lives_x = floor((CANVAS_SIZE - _ltw - _lcw)/2 + _ltw);
            respawn_lives_y = CANVAS_SIZE div 2;
        }
        break;
    case 2: // Lives remaining intro
        respawn_lives_progress = min(1, respawn_lives_progress + respawn_lives_speed);
        if (respawn_lives_progress >= 1) respawn_phase++;
        break;
    case 3: // Lives remaining hold
        respawn_lives_hold_current++;
        if (respawn_lives_hold_current >= respawn_lives_hold) {
            respawn_phase++;
            respawn_lives_hold_current = 0;
        }
        break;
    case 4: // Lives remaining outro
        respawn_lives_progress = max(0, respawn_lives_progress - respawn_lives_speed);
        if (respawn_lives_progress <= 0) {
            respawn_phase++;
            respawn_lives_show = false;
        }
        break;
    case 5: // Enable input
        G.input_enabled = true;
        respawn_phase = 0;
        state = GAME_STATE.PLAYING;
        break;
        
    }
    break;
#endregion

#region Game over
case GAME_STATE.GAME_OVER:
    G.layer_alpha = max(0, G.layer_alpha - 0.02);
    switch (game_over_phase) {
    
    case 0: // Stop cruiser sound loops
        with (obj_cruiser) {
            flight_sound_control_gain = false;
            audio_sound_gain(flight_sound, 0, 2000);
        }
        game_over_phase++;
        break;
    case 1: // Game over intro
        game_over_progress = min(1, game_over_progress + game_over_speed);
        if (game_over_progress >= 1) game_over_phase++;
        break;
    case 2: // Game over hold
        game_over_hold_current++;
        if (game_over_hold_current >= game_over_hold) {
            game_over_phase++;
            game_over_hold_current = 0;
        }
        break;
    case 3: // Game over outro
        game_over_progress = max(0, game_over_progress - game_over_speed);
        if (game_over_progress <= 0) game_over_phase++;
        break;
    case 4: // Go to main menu
        G.layer_alpha = 1;
        instance_create_layer(x, y, layer, sys_scroll_main_menu);
        room_goto(room_menu);
        break;
        
    }
    break;
#endregion

}
