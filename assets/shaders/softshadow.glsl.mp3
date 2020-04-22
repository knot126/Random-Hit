uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;

varying float vAlpha;
varying vec2 vTexCoord;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute float aAlpha;

void main(void)
{
	vTexCoord = aTexCoord;
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	float fog = clamp(0.1 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vAlpha = (1.0-fog) * aAlpha;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vec4(0, 0, 0, texture2D(uTexture0, vTexCoord).a * vAlpha);
}
#endif

