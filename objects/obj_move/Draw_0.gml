/// @desc Draw self

if sprite_index != -1
{
	if knockback > 0 shader_set(sh_white);
	
	draw_sprite_ext(sprite_index, image_index, x, y,
		(dir * scale), image_yscale - vel.y / scale_v, angle, image_blend, 1);
	
	shader_reset();
}