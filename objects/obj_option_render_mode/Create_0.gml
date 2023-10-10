event_inherited();

text = G.pixel_mode ? "SMOOTH MODE" : "PIXEL MODE";
action = function() {
    if (G.pixel_mode) {
        text = "PIXEL MODE";
        G.game_scale = G.game_size div CANVAS_SIZE;
        surface_resize(application_surface, G.game_size, G.game_size);
    } else {
        text = "SMOOTH MODE";
        G.game_scale = 1;
        surface_resize(application_surface, CANVAS_SIZE, CANVAS_SIZE);
    }
    ini_open(DATAFILE);
    G.pixel_mode = !G.pixel_mode;
    ini_write_real("SETTINGS", "PIXEL_MODE", G.pixel_mode);
    ini_close();
};
