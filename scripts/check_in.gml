var in = rectangle_in_rectangle(
    x - sprite_width,
    y - sprite_height,
    sprite_width * 2,
    sprite_height * 2,
    view_xview[0],
    view_yview[0],
    view_xview[0]+view_wport[0],
    view_yview[0]+view_hport[0],    
);

return in;
