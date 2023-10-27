/// @description Update gamepad joystick-to-keyboard emulation

if (G.gpad_slot != -1) {
    array_copy(G.gpad_joy_prev, 0, G.gpad_joy, 0, array_length(G.gpad_joy));
    var _joy_x = gamepad_axis_value(G.gpad_slot, gp_axislh);
    var _joy_y = gamepad_axis_value(G.gpad_slot, gp_axislv);
    if (point_distance(0, 0, _joy_x, _joy_y) >= 1 - G.gpad_sensitivity) {
        var _octant = (vector_direction(_joy_x, _joy_y) - 22.5) div 45;
        G.gpad_joy[INPUT.UP]    = _octant >= 0 && _octant <= 2;
        G.gpad_joy[INPUT.LEFT]  = _octant >= 2 && _octant <= 4;
        G.gpad_joy[INPUT.DOWN]  = _octant >= 4 && _octant <= 6;
        G.gpad_joy[INPUT.RIGHT] = _octant == 6 || _octant == 7 || _octant == 0;
    } else {
        for (var i = 0; i < array_length(G.gpad_joy); i++)
            G.gpad_joy[i] = false;
    }
}
