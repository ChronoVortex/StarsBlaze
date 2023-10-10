event_inherited();

enum ENEMY_STATE {
    ARRIVE,
    IDLE,
    ASSAULT
}

hp = 4;
hp_max = 4;

points = 100;

state = ENEMY_STATE.ARRIVE;
arrive_progress = 0;
arrive_speed = 0.007;
arrive_path = -1;

function scale_difficulty(_level) {
    if (_level > 0) {
        arrive_speed += _level*0.001;
        bullet_speed += _level*0.01;
        aim_wait_max =  max(0, aim_wait_max - _level);
        aim_wait_min_inc = max(0, aim_wait_min_inc - 0.5*_level);
        aim_wait_max_inc = max(0, aim_wait_max_inc - _level);
        var _enemies = instance_number(obj_enemy);
        var _wait_min = aim_wait_min + _enemies*aim_wait_min_inc;
        var _wait_max = aim_wait_max + _enemies*aim_wait_max_inc;
        aim_wait_current = random_range(_wait_min, _wait_max);
        aim_radius = max(0, aim_radius - _level);
        aim_speed_min += _level;
        aim_speed_max += _level;
        aim_speed_current = aim_speed_min;
    }
}

explosion = ps_explosion_enemy;
