/// @desc Draw UI

var _cam = obj_camera.cam;

draw_set_font(fnt_score);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_left);

draw_text(_cam.x + 16, _cam.y + 16, "Score - " + string(score));
//draw_text(_cam.x + 16, _cam.y + 32, "Best - " + string(sav.get("score")));
//if !PROMO draw_text(_cam.x + 16, _cam.y + 48, "Level - " + string(sav.get("level")));

// Fade to black

black = lerp(black, instance_exists(obj_playerCorpse) ? 1 : 0, 0.05);

draw_set_colour(c_black);
draw_set_alpha(black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

if black > 0.99 Restart();

// Pause

if pause and display
{
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_font(fnt_pause);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour(c_white);
	draw_text(_cam.x + _cam.w / 2, _cam.y + _cam.h / 2, "Paused");
}

// Crosshair

draw_sprite(spr_crosshair, 0, mouse_x, mouse_y);