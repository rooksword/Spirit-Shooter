/// @desc Movement

if obj_control.pause
{
	mask_index = -1;
	exit;
}
else
{
	mask_index = sprite_index;	
}

if instance_exists(obj_enemy)
{
	var _inst = instance_nearest(x, y, obj_enemy);
	var _dir = point_direction(x, y, _inst.x, _inst.y);
	image_angle -= angle_difference(image_angle, _dir) * homing;
}

vel = new Vec2(lengthdir_x(spd, image_angle), lengthdir_y(spd, image_angle));

x += vel.x;
y += vel.y;

if place_meeting(x, y, obj_wall)
{
	BulletDestroy();
}

if image_index == 0 image_index++;