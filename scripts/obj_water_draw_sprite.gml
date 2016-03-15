var use_surface_offset = argument0 or false;

var time = get_timer() / 1000000;
var k = 3;
var off_y = sin(time + y) * k;
var off_x =0;

var zoom = 1;
/*if use_surface_offset {
    off_x += view_xview[0];
    off_y += view_yview[0];    
    zoom = global.zoom_k;
}*/

draw_sprite_ext(
    sprite_index, 
    image_index, 
    (x - off_x) / zoom, 
    (y - off_y) / zoom,
    1 / zoom,
    1 / zoom,
    0,
    c_white,
    1
);
