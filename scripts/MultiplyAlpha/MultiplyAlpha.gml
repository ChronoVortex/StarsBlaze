/// @desc  Draw begin script for layer alpha multiplication.
function layer_alpha_draw_begin() {
    if (event_type == ev_draw && event_number == ev_draw_normal) {
        shader_set(sh_alpha_mult);
        shader_uniform_f("u_fMultiplier", G.layer_alpha);
    }
}

/// @desc  Draw end script for layer alpha multiplication.
function layer_alpha_draw_end() {
    if (event_type == ev_draw && event_number == ev_draw_normal) {
        shader_reset();
    }
}
