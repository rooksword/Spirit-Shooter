/// @desc Draw sprite

draw_set_font(fnt_pause);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(room_width / 2, (room_height / 4) * 1, "NEW GUN UNLOCKED");

var _name = "AK-47";
switch global.gun_unlock
{
	case spr_pistol: _name = "AKIMBO PISTOLS"; break;
	case spr_smg: _name = "MAC-10"; break;
	case spr_sniper: _name = "SNIPER RIFLE"; break;
	case spr_shotgun: _name = "SHOTGUN"; break;
	case spr_plasma: _name = "PLASMA RIFLE"; break;
	case spr_rifleBurst: _name = "BURST RIFLE"; break;
	case spr_rifleCharge: _name = "CHARGE RIFLE"; break;
	case spr_machineGun: _name = "ULTRA MACHINE GUN"; break;
}

draw_text(room_width / 2, 32 + (room_height / 4) * 3, _name);

var _s = 3;
var _spr = sprite_duplicate(global.gun_unlock);
sprite_set_offset(_spr, sprite_get_width(_spr) / 2, sprite_get_height(_spr) / 2);
draw_sprite_ext(_spr, -1, room_width / 2, room_height / 2, _s, _s, sin(time++ / 20) * 15, c_white, 1);

black = lerp(black, progress ? 1 : 0, 0.05);

draw_set_colour(c_black);
draw_set_alpha(black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

if black > 0.99 and progress room_goto(rm_level0);