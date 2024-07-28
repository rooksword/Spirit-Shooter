/// @desc Variables

function BulletDestroy()
{
	instance_create_layer(x, y, "Instances", obj_impact, { image_angle: image_angle });
	instance_destroy();		
}

hit = ds_list_create();

vel = new Vec2();