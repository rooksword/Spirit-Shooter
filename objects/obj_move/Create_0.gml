/// @desc Variables

#region Movement

acc = 0.3;
dec = 0.2;
vel = new Vec2();

vel_max = 10;

collision = false;
onground_max = 10;
onground = onground_max;

knockback = 0;
bounce = false;

#endregion

#region Animation variables

dir = 1;
move = 0;

scale = 1;
scale_h = 0.3;
scale_v = 28;
scale_acc = 0.1;

angle = 0;
angle_max = 15;
angle_acc = 0.075;

imagespeed = image_speed;

#endregion