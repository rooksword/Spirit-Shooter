/// @desc Destroy surfaces and buffer

if surface_exists(wall) surface_free(wall);
if surface_exists(blood) surface_free(blood);
if buffer_exists(blood_buffer) buffer_delete(blood_buffer);