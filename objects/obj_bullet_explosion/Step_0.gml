event_inherited();

scale += scale_speed;
image_xscale = scale;
image_yscale = scale;

if (scale >= 1) {
    instance_destroy();
} else if (scale > scale_vanish_threshold) {
    col_alpha = 1 - (scale - scale_vanish_threshold)/(1 - scale_vanish_threshold);
}
