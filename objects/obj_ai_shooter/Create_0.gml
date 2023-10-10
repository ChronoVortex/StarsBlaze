shoot = true;

// Bullet stuff
function shoot_one_bullet(_spd, _dir) {
    audio_play_sound(snd_shoot_enemy, 10, false);
    var _bullet = instance_create_layer(x, y, layer, obj_bullet_enemy);
    _bullet.speed = _spd;
    _bullet.direction = _dir;
}
function shoot_two_bullet(_spd, _dir) {
    audio_play_sound(snd_shoot_enemy, 10, false);
    var _a1 = image_angle + 45;
    var _a2 = image_angle - 45;
    var _len = sprite_get_width(sprite_index)/2 - 1;
    var _b1 = instance_create_layer(x + lengthdir_x(_len, _a1), y + lengthdir_y(_len, _a1), layer, obj_bullet_enemy);
    var _b2 = instance_create_layer(x + lengthdir_x(_len, _a2), y + lengthdir_y(_len, _a2), layer, obj_bullet_enemy);
    _b1.speed = _spd;
    _b1.direction = _dir;
    _b2.speed = _spd;
    _b2.direction = _dir;
}
bullet_shoot = shoot_one_bullet;
bullet_speed = 0.7;

// Aiming stuff
aim_wait_min = 0;
aim_wait_max = 20;
aim_wait_min_inc = 10;
aim_wait_max_inc = 20;
var _enemies = instance_number(obj_enemy);
var _wait_min = aim_wait_min + _enemies*aim_wait_min_inc;
var _wait_max = aim_wait_max + _enemies*aim_wait_max_inc;
aim_wait_current = random_range(_wait_min, _wait_max);
aim_radius = 20;
aim_current = -1;
aim_speed_min = 4;
aim_speed_max = 5;
aim_speed_current = 4;
