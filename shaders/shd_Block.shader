//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform float level;
uniform float f_time;
uniform float i_block_type;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_time;

void main()
{
    float k = 4.;
    vec2 off = vec2(0);
    if (i_block_type == 1.) { // if water
        off = vec2(cos(f_time - in_Position.x), sin(f_time + in_Position.y)) * 3.;
    }
    vec4 object_space_pos = vec4( in_Position.x - off.x - level, in_Position.y - off.y - level, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_time = f_time;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_time;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

