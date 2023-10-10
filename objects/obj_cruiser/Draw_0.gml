/// @desc Draw self and nodes

draw_self();
array_foreach(nodes, function(_node) {
    if (instance_exists(_node)) with (_node) event_perform(ev_draw, ev_draw_normal);
});
