// function to draw sprite on surface

var zoom_k = argument0;
var color = argument1;
var view_index = argument2;

draw_sprite_ext(
    sprite_index, image_index, 
    (x - view_xview[view_index]) / zoom_k, 
    (y - view_yview[view_index]) / zoom_k, 
    1 / zoom_k, 1 / zoom_k, 0, color, 1
);
