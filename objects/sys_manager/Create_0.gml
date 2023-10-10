/// @desc Initialize

SINGLETON

G.manager = id;
G.game = noone;
G.player = noone;
G.layer_alpha = 1;

// Read game data
ini_open(DATAFILE);

G.pixel_mode = ini_read_real("SETTINGS", "PIXEL_MODE", false);
if (!G.pixel_mode) {
    G.game_scale = G.game_size div CANVAS_SIZE;
    surface_resize(application_surface, G.game_size, G.game_size);
}

window_set_fullscreen(ini_read_real("SETTINGS", "FULLSCREEN", false));

if (ini_read_real("SETTINGS", "SHOW_CONTROLS", true)) {
    ini_write_real("SETTINGS", "SHOW_CONTROLS", false);
    room_goto(room_controls);
} else {
    room_goto(room_menu);
}

ini_close();

// Opening darkness timers
start_timer = 15;
darkness_timer = 15;

// Star background particles
star_sys = part_system_create();
part_system_automatic_draw(star_sys, false);
part_system_automatic_update(star_sys, true);

star_emitter = part_emitter_create(star_sys);
part_emitter_region(star_sys, star_emitter, 0, CANVAS_SIZE, 0, 0, ps_shape_line, ps_distr_linear);

star_emitter_init = part_emitter_create(star_sys);
part_emitter_region(star_sys, star_emitter_init, 0, CANVAS_SIZE, 0, CANVAS_SIZE, ps_shape_rectangle, ps_distr_linear);

star_part_variations = 16;
star_part_speed_min = 0.4;
star_part_speed_max = 0.7;
star_part_alpha_min = 0.05;
star_part_alpha_max = 0.4;
star_parts = array_create_ext(star_part_variations, function(_index) {
    var _lerp_amt = _index/(star_part_variations - 1);
    var _spd = lerp(star_part_speed_min, star_part_speed_max, _lerp_amt);
    var _alpha = lerp(star_part_alpha_min, star_part_alpha_max, _lerp_amt);
    var _part = part_type_create();
    part_type_shape(_part, pt_shape_pixel);
    part_type_speed(_part, _spd, _spd, 0, 0);
    part_type_direction(_part, -90, -90, 0, 0);
    part_type_color1(_part, c_white);
    part_type_alpha1(_part, _alpha);
    part_type_life(_part, 500, 500);
    part_emitter_burst(star_sys, star_emitter_init, _part, round(CANVAS_SIZE/star_part_variations));
    return _part;
});

/// @desc Make the background stars scroll from the right of the screen to the left.
function stars_right_to_left() {
    part_emitter_region(star_sys, star_emitter, CANVAS_SIZE, CANVAS_SIZE, 0, CANVAS_SIZE, ps_shape_line, ps_distr_linear);
    array_foreach(star_parts, function(_part) {
        part_type_direction(_part, 180, 180, 0, 0);
    });
}

/// @desc Make the background stars scroll from the top of the screen to the bottom.
function stars_top_to_bottom() {
    part_emitter_region(star_sys, star_emitter, 0, CANVAS_SIZE, 0, 0, ps_shape_line, ps_distr_linear);
    array_foreach(star_parts, function(_part) {
        part_type_direction(_part, -90, -90, 0, 0);
    });
}
