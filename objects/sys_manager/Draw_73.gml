// Opening fade in from black
var _alpha = darkness_timer/15;
if (_alpha > 0) {
	draw_set_alpha(_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
}
