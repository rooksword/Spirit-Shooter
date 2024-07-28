/// @desc Variables

res = new Vec2(1024, 576);

wall = surface_create(res.x, res.y);
blood = surface_create(res.x, res.y);
blood_buffer = buffer_create(res.x * res.y * 4, buffer_fixed, 1);

cube = surface_create(res.x, res.y);

function DrawBlood(_x, _y)
{
	surface_set_target(blood);
	draw_sprite_ext(spr_blood, 0, _x, _y, 1, 1, random(360), make_color_rgb(64, 0, 0), 1);
	gpu_set_blendmode(bm_subtract);
	draw_surface(wall, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}