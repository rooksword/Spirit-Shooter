/// @desc Variables

ps = part_system_create_layer("Corpse", false);
smoke = part_type_create();
part_type_shape(smoke, pt_shape_disk);
part_type_size(smoke, 0.25, 0.75, -0.005, 0);
part_type_color2(smoke, c_dkgray, c_black);
part_type_speed(smoke, 0.25, 1, -0.001, 0);
part_type_direction(smoke, 90, 90, 0, 0);
part_type_life(smoke, 150, 150);

function Smoke(_x, _y)
{
	repeat 50 part_particles_create(ps, _x + random_range(-32, 32), _y + random_range(-32, 32), smoke, 1);
}