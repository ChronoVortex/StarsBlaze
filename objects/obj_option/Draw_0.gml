if (sprite_index == spr_option) {
    draw_set_color(selected ? c_yellow : c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(font);
    draw_text(x, y, text);
} else {
    draw_self();
}
