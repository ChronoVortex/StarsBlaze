#region Movement

var _move_horz = input_check(INPUT.RIGHT) - input_check(INPUT.LEFT);
var _move_vert = input_check(INPUT.DOWN) - input_check(INPUT.UP);

if (abs(_move_horz) || abs(_move_vert)) {
    var _dir = vector_direction(_move_horz, _move_vert);

    _move_horz = lengthdir_x(spd, _dir);
    _move_vert = lengthdir_y(spd, _dir);
    
    if (instance_exists(zone)) {
        // Stay inside the bounds of my zone
        if (bbox_right + _move_horz > zone.bbox_right) {
            x = zone.bbox_right - (bbox_right - x);
        } else if (bbox_left + _move_horz < zone.bbox_left) {
            x = zone.bbox_left + (x - bbox_left);
        } else {
            x += _move_horz;
        }
        if (bbox_bottom + _move_vert > zone.bbox_bottom) {
            y = zone.bbox_bottom - (bbox_bottom - y);
        } else if (bbox_top + _move_vert < zone.bbox_top) {
            y = zone.bbox_top + (y - bbox_top);
        } else {
            y += _move_vert;
        }
    } else {
        x += _move_horz;
        y += _move_vert;
    }
}

#endregion

#region Lasers

if (primary_cooldown_current > 0) {
    primary_cooldown_current--;
} else if (input_check_pressed(INPUT.PRIMARY) && instance_number(obj_bullet_player) < primary_max) {
    audio_play_sound(snd_shoot_player, 10, false);
    var _b1 = instance_create_layer(bbox_left, bbox_top, layer, obj_bullet_player);
    var _b2 = instance_create_layer(bbox_right - 1, bbox_top, layer, obj_bullet_player);
    _b1.vspeed = -1;
    _b2.vspeed = -1;
}

#endregion

#region Bombs

 if (input_check_pressed(INPUT.SECONDARY) && !instance_number(obj_bullet_bomb)) {
    audio_play_sound(snd_shoot_bomb, 10, false);
    var _bomb = instance_create_layer(x, y, layer, obj_bullet_bomb);
    _bomb.target_y = y - bomb_dist;
}

#endregion
