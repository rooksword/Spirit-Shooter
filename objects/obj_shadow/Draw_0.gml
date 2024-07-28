/// @desc Draw surface

if !surface_exists(surface) surface = surface_create(room_width, room_height);
surface_set_target(surface);
draw_clear_alpha(c_white, 0);
draw_sprite(bg_walls, 0, 0, 0);
with obj_cast event_perform(ev_draw, 0);
surface_reset_target();
draw_surface_ext(surface, 8, 8, 1, 1, 0, c_black, 0.5);