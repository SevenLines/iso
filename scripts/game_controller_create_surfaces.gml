var force = argument0;
var new_w = surface_get_width(application_surface) / surf_blur_pass_k;
var new_h = surface_get_height(application_surface) / surf_blur_pass_k;
if force || !surface_exists(surf_blur_pass) {
    surf_blur_pass = surface_create(
        new_h,
        new_h
    );
} else {
    if surface_get_width(surf_blur_pass) != new_w ||
        surface_get_height(surf_blur_pass) != new_h {
        surface_resize(surf_blur_pass, new_w, new_h);
    }
}

if force || !surface_exists(surf_bloom) {
    surf_bloom = surface_create(
        new_w,
        new_h
    );
} else {
    if surface_get_width(surf_bloom) != new_w ||
        surface_get_height(surf_bloom) != new_h {
        surface_resize(surf_bloom, new_w, new_h);
    }
}
