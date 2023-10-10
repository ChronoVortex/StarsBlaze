nodes = array_create(2, noone);
sine_amp = 6;
sine_spd = 0.02;
start_y = y;

flight_sound = audio_play_sound(snd_cruiser, 0, true, 0);
flight_sound_control_gain = true;

function cruiser_init(_move_right = true) {
    var _move_sign = bool_to_sign(_move_right);
    
    hspeed = 0.2*_move_sign;
    if (!_move_right) image_xscale = -1;
    
    var _n1, _n2;
    _n1 = instance_create_layer(x, y, layer, obj_cruiser_node_bomb);
    _n2 = instance_create_layer(x, y, layer, obj_cruiser_node_turret);
    
    _n1.cruiser = id;
    _n1.offset_x = -5*_move_sign - _move_right;
    _n1.offset_y = 15;
    nodes[0] = _n1;
    
    _n2.cruiser = id;
    _n2.offset_x = 15*_move_sign - _move_right;
    _n2.offset_y = 15;
    nodes[1] = _n2;
}
