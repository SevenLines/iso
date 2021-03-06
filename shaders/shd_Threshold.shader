//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_Threshold;
uniform sampler2D u_Mask;

void main()
{
    vec4 mask_color = texture2D(u_Mask, v_vTexcoord);
    if (mask_color.a > 0.) {
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
        gl_FragColor.rgb = max(vec3(0.), gl_FragColor.rgb - u_Threshold);
        gl_FragColor.rgb /= 1. - u_Threshold;
    } else {
        gl_FragColor = vec4(0., 0., 0., 1.);
    }
}

