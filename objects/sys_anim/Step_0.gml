if (sprite_index > -1) {
    if (image_index + anim_speed >= sprite_get_number(sprite_index)) {
        repetitions_current++;
        if (repetitions_current >= repetitions) instance_destroy();
    }
    image_index += anim_speed;
} else if (part_system_exists(part_sys)) {
    part_system_position(part_sys, x, y);
    if (part_particles_count(part_sys) <= 0) instance_destroy();
}
