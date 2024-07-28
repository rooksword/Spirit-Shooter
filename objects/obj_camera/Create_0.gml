/// @description Variables

window_set_cursor(cr_none);

range = 0;
acc = 0.1;
shake = 0;
cam = {
  x: camera_get_view_x(view_camera[0]),
  y: camera_get_view_y(view_camera[0]),
  w: camera_get_view_width(view_camera[0]),
  h: camera_get_view_height(view_camera[0]),
};