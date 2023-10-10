randomize();

var _min_dimension = min(display_get_width(), display_get_height());
G.game_size = floor_ext(0.85*_min_dimension, CANVAS_SIZE);
G.game_scale = 1;
window_set_size(G.game_size, G.game_size);
window_center();
