/// @desc Draw self

kick = can_shoot / 2;

function _gun()
{
	var _col = 0;
	if guns[gun_index].charge != 0 _col = min(charge / guns[gun_index].charge, 1);
	
	var _x = x - (can_shoot / 4) * 2 * dir;
	var _dir = direction + (can_shoot / 4) * 2 * dir;
	
	if gun_index == 3
	{
		draw_line_width_color(_x, y, _x + lengthdir_x(room_width, _dir), y + lengthdir_y(room_width, _dir), 2, c_maroon, c_black);	
	}
	
	draw_sprite_ext(guns[gun_index].sprite_index, 0,
		x - lengthdir_x(kick, direction), y - lengthdir_y(kick, direction),
		image_xscale, dir, _dir, merge_color(c_white, c_maroon, _col), image_alpha);
}

function _gun_dual()
{
	if gun_index == 5
	{
		draw_sprite_ext(guns[gun_index].sprite_index, 0,
			x + lengthdir_x(kick, direction), y + lengthdir_y(kick, direction),
			-image_xscale, dir, direction - (can_shoot / 4) * 2 * dir, image_blend, image_alpha);	
	}	
}

if knockback > 0 shader_set(sh_white);

if gun_dir < 0 _gun();
else _gun_dual();
event_inherited();
if gun_dir >= 0 _gun();
else _gun_dual();

shader_reset();

with obj_bullet event_perform(ev_draw, 0);