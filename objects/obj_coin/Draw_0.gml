/// @desc Draw self

if flash > 0 shader_set(sh_white);

yy = start + (sin(time++ / 40) * range);

if gun != 5
{
	draw_sprite_ext(sprite_index, image_index, x, yy, image_xscale, image_yscale,
		sin(time / 80) * 5, image_blend, image_alpha);
}
else
{
	draw_sprite_ext(sprite_index, image_index, x - 6, yy - 6, image_xscale, image_yscale,
		sin(time / 80) * 5, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + 6, yy + 6, image_xscale, image_yscale,
		sin(time / 80) * 5, image_blend, image_alpha);
}

shader_reset();