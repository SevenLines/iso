// zoom_room(k)
var k = argument0;
var view = 0;

var off_x = abs(view_wview[view]*k - view_wview[view]);
var off_y = abs(view_hview[view]*k - view_hview[view]);

view_wview[view] *= k;
view_hview[view] *= k;

if ( k < 1) {
    view_xview[view] += off_x/2;
    view_yview[view] += off_y/2;    
} else {
    view_xview[view] -= off_x/2;
    view_yview[view] -= off_y/2;       
}

gui_update_positions(0);
