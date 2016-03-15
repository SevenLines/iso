// get_iso_position(xx, yy) 
// xx, yy -- position in map grid
var xx = argument0;
var yy = argument1;

var out;
out[1] = yy*global.sh / 2 - xx * (global.sh / 2);
out[0] = xx*global.sw - (xx * (global.sw / 2) - yy * (global.sw / 2));


return out
