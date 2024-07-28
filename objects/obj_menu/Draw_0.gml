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

// Guns unlcoked

draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var _level = obj_control.sav.get("level") - 1;
var _str = "Guns unlocked - " + string(_level) + " / " + string(array_length(obj_player.roster));

var _spr = sprite_duplicate(obj_player.roster[_level].sprite_index);
sprite_set_offset(_spr, sprite_get_width(_spr) / 2, sprite_get_height(_spr) / 2);

draw_sprite_ext(_spr, 0 ,
	_cam.x + 16 + string_width(_str) / 2, _cam.y + _cam.h - 45 + (96 * (1 - offset)),
		2, 2,
		0, c_black, 1);

draw_text(_cam.x + 16, _cam.y + _cam.h - 16 + (64 * (1 - offset)),
	_str);