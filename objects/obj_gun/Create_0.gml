/// @desc Variables

start = y;
yy = y;
time = 0;
range = 8;

scale = new Vec2();
image_xscale = scale.x;
image_yscale = scale.y;

flash = -1;

gun = irandom(array_length(obj_player.guns) - 1);
if array_length(obj_player.guns) > 1 while gun = obj_player.gun_index gun = irandom(array_length(obj_player.guns) - 1);
sprite_index = sprite_duplicate(obj_player.guns[gun].sprite_index);
sprite_set_offset(sprite_index, sprite_get_width(sprite_index) / 2, sprite_get_height(sprite_index) / 2);
mask_index = sprite_index;