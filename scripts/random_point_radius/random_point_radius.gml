/// @desc       Get a random point inside a circle.
/// @arg {Real} x       The x coordinate of the circle's center.
/// @arg {Real} y       The y coordinate of the circle's center.
/// @arg {Real} radius  The radius of the circle.
/// @return {Struct.Point}
function random_point_radius(_x, _y, _radius) {
    var _r = _radius*sqrt(random(1));
    var _theta = tau*random(1);
    return new Point(_x + _r*cos(_theta), _y + _r*sin(_theta));
}
