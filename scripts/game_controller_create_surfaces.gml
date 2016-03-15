var force = argument0;
if force || !surface_exists(surf_blur_pass) {
    surf_blur_pass = surface_create(
        surface_get_width(application_surface) / surf_blur_pass_k,
        surface_get_height(application_surface) / surf_blur_pass_k
    );
}

if force || !surface_exists(surf_bloom) {
    surf_bloom = surface_create(
        surface_get_width(application_surface) / surf_blur_pass_k,
        surface_get_height(application_surface) / surf_blur_pass_k
    );
}
