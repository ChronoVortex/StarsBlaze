/// @description Draw text for voice line

if (show_text) {
    draw_set_font(fnt_pixel_3);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text_ext(CANVAS_SIZE div 2, CANVAS_SIZE - 3, "Good luck, pilot!", 4, CANVAS_SIZE);
}
