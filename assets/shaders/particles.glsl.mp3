uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;

varying vec2 vTexCoord;
varying float vAlpha;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute float aAlpha;

void main(void)
{
	vTexCoord = aTexCoord;
	vAlpha = aAlpha;
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 texColor = texture2D(uTexture0, vTexCoord);
	texColor.a *= vAlpha;
	gl_FragColor = texColor;
}
#endif

