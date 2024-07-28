/// @desc Draw menu

// Positions

var _cam = obj_camera.cam;

x = _cam.x + _cam.w / 2;
y = _cam.y + _cam.h - (offset * dist);

// Logo

draw_sprite(spr_logo, 0, x, _cam.y + (offset * dist) + (sin(time++ / 60) * range));

// Play button

var _mouse = position_meeting(mouse_x, mouse_y, self);
var _scale = 1 - (_mouse * 0.05);
draw_sprite_ext(spr_buttonPlay, 0, x, y, _scale, _scale, image_angle,
	merge_colour(c_white, c_ltgray, _mouse), image_alpha);