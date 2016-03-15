var obj_type = argument0;
with(new_object) {
    instance_destroy();
}

if obj_type != noone {
    new_object = instance_create(0, 0, obj_type);
    with(new_object) {
        other.cursor_size_w = size_w;
        other.cursor_size_h = size_h;    
    }
}
