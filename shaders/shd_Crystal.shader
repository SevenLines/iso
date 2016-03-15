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

uniform float u_time;
uniform vec4 u_sprite_uv;
uniform sampler2D u_mask;
uniform vec4 u_mask_uv;

void main()
{   
    float left = u_sprite_uv.x;
    float top = u_sprite_uv.y;    

    float m_left = u_mask_uv.x;
    float m_top = u_mask_uv.y;    
       
    vec2 uv = v_vTexcoord;
    
    vec2 uv_rel = uv - vec2(left, top);
    vec4 mask_tex = texture2D( u_mask, uv_rel + vec2(m_left, m_top) );
    
    if (mask_tex.r > 0.) {
        uv = vec2(
            uv.x + sin(uv.y * 50. + u_time)/ 400. * mask_tex.r,
            uv.y + cos(uv.x * 50. + u_time)/ 400. * mask_tex.r 
        );
    }
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
}

