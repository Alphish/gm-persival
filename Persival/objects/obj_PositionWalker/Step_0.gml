var _xshift = keyboard_check(vk_right) - keyboard_check(vk_left);
var _yshift = keyboard_check(vk_down) - keyboard_check(vk_up);

if (_xshift == 0 && _yshift == 0)
    return;

var _sidedist = (_xshift != 0 && _yshift != 0) ? 5 : 7;

x += _xshift * _sidedist;
x = clamp(x, 0, room_width);

y += _yshift * _sidedist;
y = clamp(y, 0, room_height);

image_angle = point_direction(0, 0, _xshift, _yshift);
