/// @desc Exit menu

offset = lerp(offset, active ? 1 : -1, 0.1);

if !active and ((offset * dist) + dist) < 0.1 instance_destroy();