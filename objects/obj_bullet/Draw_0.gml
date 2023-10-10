var _shift = col_shift;
if (col_shift > 0.5) _shift = 1 - _shift;
_shift *= 2;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, merge_color(col1, col2, _shift), col_alpha);
