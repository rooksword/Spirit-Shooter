/// @description Movement

var _target = obj_player;
if !instance_exists(obj_player) 
{
	_target = obj_playerCorpse;
	range = 0;
}

if instance_exists(obj_player) and obj_player.fsm.get_current_state() == "movement" range = lerp(range, (mouse_x - obj_player.x) / 6, 0.5);
x = lerp(x, _target.x + range, acc);
y = lerp(y, _target.y, acc);
 
shake = lerp(shake, 0, 0.1);

cam = {
	x: camera_get_view_x(view_camera[0]),
	y: camera_get_view_y(view_camera[0]),
	w: camera_get_view_width(view_camera[0]),
	h: camera_get_view_height(view_camera[0]),
};

cam.x = x - (cam.w / 2);
cam.y = y - (cam.h / 2);

cam.x = clamp(cam.x, 0, room_width - cam.w) + random_range(-shake, shake);
cam.y = clamp(cam.y, 0, room_height - cam.h) + random_range(-shake, shake);

camera_set_view_pos(view_camera[0], cam.x, cam.y);