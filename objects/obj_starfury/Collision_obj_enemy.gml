/// @description Destroy on hit

if (G.input_enabled) {
    instance_destroy(other);
    instance_destroy();
}
