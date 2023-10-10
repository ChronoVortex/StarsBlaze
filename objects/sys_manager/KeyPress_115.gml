/// @description Fullscreen toggle

var _fullscreen = !window_get_fullscreen();
window_set_fullscreen(_fullscreen);
window_set_size(G.game_size, G.game_size);

ini_open(DATAFILE);
ini_write_real("SETTINGS", "FULLSCREEN", _fullscreen);
ini_close();
