//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 shift;

vec4 Multiply (in vec4 Color, in vec3 Shift)
{
	vec3 white = vec3(1.0, 1.0, 1.0);
	if (Color.rgb != white)
	{
		return vec4(Color.r * Shift.r, Color.g * Shift.g, Color.b * Shift.b, Color.a);
	}
	else
	{
		return Color;	
	}
}

void main()
{
	vec4 inp = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 colour = Multiply(inp, shift);
    gl_FragColor = colour;
}