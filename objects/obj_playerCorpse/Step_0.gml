/// @desc Movement

#region Movement

vel.x = lerp(vel.x, 0, 0.1);
if vel.y < vel_max vel.y += grav;

event_inherited();