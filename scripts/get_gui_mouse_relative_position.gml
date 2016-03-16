var out;
var device_x = device_mouse_x_to_gui(0);
var device_y = device_mouse_y_to_gui(0);

out[0] = device_x - real_x;
out[1] = device_y - real_y;

return out;
