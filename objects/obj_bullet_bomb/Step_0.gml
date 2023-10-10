event_inherited();

// Target reached, destroy self and cruiser node if it's colliding
if (abs(y - target_y) < spd) {
    with (obj_cruiser_node) if (point_distance(x, y, other.x, other.target_y) <= sprite_width/2) {
        instance_destroy();
        break;
    }
    instance_destroy();
}

// Move toward target
y -= spd;
var _scale = lerp(0.4, 1, abs(y - target_y)/abs(start_y - target_y));
image_xscale = _scale;
image_yscale = _scale;
