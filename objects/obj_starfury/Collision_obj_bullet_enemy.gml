/// @description Destroy on hit

if (G.input_enabled) {
    if (other.object_index != obj_bullet_beam) instance_destroy(other);
    instance_destroy();
}
