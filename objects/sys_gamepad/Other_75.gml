/// @description Update gamepad slots

var _slot;
switch (async_load[? "event_type"]) {
    case "gamepad discovered":
        _slot = async_load[? "pad_index"];
        
        // Update the array of gamepad connections
        gpad_slots[_slot] = true;
        
        // Use this gamepad slot if we don't already have one
        if (G.gpad_slot == -1) G.gpad_slot = _slot;
        
        break;
    case "gamepad lost":
        _slot = async_load[? "pad_index"];
        
        // Update the array of gamepad connections
        gpad_slots[_slot] = false;
        
        // If this slot is in use, stop using it
        if (G.gpad_slot == _slot) G.gpad_slot = -1;
        
        // See if there's another gamepad to use
        if (G.gpad_slot == -1) {
            for (_slot = 0; _slot < array_length(gpad_slots); _slot++) {
                if (gpad_slots[_slot] == true) {
                    G.gpad_slot = _slot;
                    break;
                }
            }
        }
        
        break;
}
