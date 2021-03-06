var view = argument0;

with(obj_GUI_base) {
    image_xscale = real_xscale * global.zoom_k;
    image_yscale = real_yscale * global.zoom_k;
    
    var xoff = sprite_get_xoffset(sprite_index);
    var yoff = sprite_get_yoffset(sprite_index);    
    
    if top != NaN {
        y = view_yview[view] + (top + yoff) * image_yscale;
    } else if bottom != NaN {
        var h = sprite_get_height(sprite_index) * image_yscale;
        y = view_yview[view] + view_hview[view] - h + (yoff - bottom) * image_yscale ;
    }
    
    if left != NaN {
        x = view_xview[view] + (left + xoff) * image_yscale;
    } else if right != NaN {
        var w = sprite_get_width(sprite_index) * image_xscale;
        x = view_xview[view] + view_wview[view] - w + (xoff - right) * image_yscale;
    }
}
