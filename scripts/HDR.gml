shader_set(shd_Threshold);
    shader_set_uniform_f(u_threshould, 0.75);
    surface_set_target(surf_bloom);
        draw_surface(application_surface, 0, 0);
    surface_reset_target();
shader_reset();

shader_set(shd_Blur);
    shader_set_uniform_f(u_scale, 0, 0.01);
    surface_set_target(surf_blur_pass);
        draw_surface(surf_bloom, 0, 0);
    surface_reset_target();
    
    shader_set_uniform_f(u_scale, 0.01, 0);
    surface_set_target(surf_bloom);
        draw_surface(surf_blur_pass, 0, 0);
    surface_reset_target();
shader_reset();

draw_surface(application_surface, 0, 0);
draw_set_blend_mode(bm_add);
draw_surface(surf_blur_pass, 0, 0);
draw_set_blend_mode(bm_normal);

//draw_surface(surf_bloom, 0, 0);

/*shader_set(shd_Blur);
shader_set_uniform_f(u_scale, 0.003 * max(0, zoom_k - 1), 0.0);

surface_set_target(surf_blur_pass);
draw_surface_ext( application_surface, 0, 0, 1 / surf_blur_pass_k, 1 / surf_blur_pass_k, 0, c_white, 1 );
surface_reset_target();

shader_set_uniform_f(u_scale, 0.005 * max(0, zoom_k - 1), 0.0);
draw_surface_ext ( surf_blur_pass, 0, 0, surf_blur_pass_k, surf_blur_pass_k, 0, c_white, 1 );

shader_reset();*/
