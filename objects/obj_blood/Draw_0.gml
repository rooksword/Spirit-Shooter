/// @desc Draw blood

if !surface_exists(wall) wall = surface_create(res.x, res.y);
surface_set_target(wall);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(bg_walls, 0, 0, 0, 1, 1, 0, c_black, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();

if !surface_exists(blood)
{
	blood = surface_create(res.x, res.y);
	buffer_set_surface(blood_buffer, blood, 0);
}

if buffer_exists(blood_buffer) buffer_delete(blood_buffer);
blood_buffer = buffer_create(res.x * res.y * 4, buffer_fixed, 1);
buffer_get_surface(blood_buffer, blood, 0);

draw_sprite(bg_walls, 0, 0, 0);
draw_surface_ext(blood, 0, 0, 1, 1, 0, c_white, 0.5);