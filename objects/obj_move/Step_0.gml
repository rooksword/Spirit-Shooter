/// @desc Movement

MoveCollision();

#region Animation

scale = lerp(scale, 1, scale_acc);
angle -= angle_difference(angle, -angle_max * move) * angle_acc;

#endregion