SINGLETON

gpad_slots = array_create(gamepad_get_device_count(), false);
G.gpad_sensitivity = 0.5;
G.gpad_slot = -1;
G.gpad_joy = array_create(4, false);
G.gpad_joy_prev = array_create(4, false);
