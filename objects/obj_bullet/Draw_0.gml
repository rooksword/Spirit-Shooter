/// @desc Draw self

if image_index > 0
{
	shader_set(sh_shift);
	shader_params = shader_get_uniform(sh_shift, "shift");
	shader_set_uniform_f(shader_params,
		colour_get_red(image_blend) / 255, colour_get_green(image_blend) / 255, colour_get_blue(image_blend) / 255);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
	c_white, image_alpha);

shader_reset();