var view = argument0;

with(obj_GUI_base) {
    image_xscale = global.zoom_k;
    image_yscale = global.zoom_k;
    
    if top != NaN {
        y = view_yview[view] + top;
    } else if bottom != NaN {
        var h = sprite_get_height(sprite_index) * image_yscale;
        y = view_yview[view] + view_hview[view] - h - bottom;
    }
    
    if left != NaN {
        x = view_xview[view] + left;
    } else if right != NaN {
        var w = sprite_get_width(sprite_index) * image_xscale;
        x = view_xview[view] + view_wview[view] - w - right;
    }
}
