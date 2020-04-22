uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec2 vTexCoord;
varying vec4 vColor;
varying float vBlend;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec4 aColor;
attribute float aAlpha;

void main(void)
{
	vTexCoord = aTexCoord;
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	float z = gl_Position.z;
	float fog = clamp(0.05 * (-5.0 + z), 0.0, 1.0);
	vColor = aColor;
	vColor.a *= 1.0-fog;
	vBlend = aAlpha;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 tex = texture2D(uTexture0, vTexCoord);
	tex *= vColor;
	tex.rgb *= tex.a;
	tex.a *= vBlend;
	gl_FragColor = tex;
}
#endif

