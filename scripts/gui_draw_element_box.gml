if sprite_exists(sprite_index) {
    draw_set_colour(c_lime);
    var xx = real_x - sprite_get_xoffset(sprite_index);
    var yy = real_y - sprite_get_yoffset(sprite_index);
    draw_rectangle(
        xx, yy, 
        xx + sprite_get_width(sprite_index) * real_xscale,
        yy + sprite_get_height(sprite_index),
        true
    );
}
