// generate_map(w, h, land_size)

var w = argument0;
var h = argument1;

var map = ds_grid_create(w, h);

var land_size_w = argument2[0];
var land_size_h = argument2[1];
var shelf_k = 0.1;
var mud_k = 0.1;

var sw = global.sw;
var sh = global.sh;

var land_x = land_size_w / 2 + random(w - land_size_w / 2);
var land_y = land_size_h / 2 + random(h - land_size_h / 2);

var obj_t;
var iso_position;
var lvl = 0; 

for (var xx=0;xx<w;++xx) {
    for (var yy=0;yy<h;++yy) {
        lvl = 0;
        iso_position = get_iso_position(xx, yy);
        obj_t = obj_Sea;
        
        var dir = degtorad(point_direction(xx, yy, land_x, land_y))
        var distance = point_distance(xx, yy, land_x, land_y);
        
        var land_max_distance = point_distance(
            0, 0, 
            cos(dir) * land_size_w / 2, 
            sin(dir) * land_size_h / 2
        );
        
        if distance <= land_max_distance {
            var diff = land_max_distance - distance;
            var k = diff / land_max_distance;
            if k < shelf_k {
                obj_t = obj_Mud;
            } else {
                lvl = sh * power(k - shelf_k, 2) * 3;
                obj_t = obj_Grass;
            }
        } 
        
        var obj = instance_create(
            iso_position[0], //xx*sw + iso_xoffset,
            iso_position[1] - lvl, //yy*sh / 2 + iso_yoffset - lvl, 
            obj_t
        );
        
        with(obj) {
            /*if (obj_t == obj_Sea) {
                image_index = random(image_number);
            }*/
            depth = 10000-yy+xx*0.01;
            level = lvl;
            ix = xx;
            iy = yy;
            //sw = 62;
            //sh = 43 - 13;
        }
        map[# xx, yy] = obj;        
    }   
}

return map;
