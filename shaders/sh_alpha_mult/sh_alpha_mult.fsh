varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fMultiplier;

void main()
{
    gl_FragColor = v_vColour*texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.a *= u_fMultiplier;
}
