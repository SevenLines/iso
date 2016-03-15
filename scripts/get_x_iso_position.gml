// get_x_iso_position(xx, yy) 
// xx, yy -- position in map grid
var xx = argument0;
var yy = argument1;

return xx*global.sw - xx * (global.sw / 2) - yy * (global.sw / 2)
