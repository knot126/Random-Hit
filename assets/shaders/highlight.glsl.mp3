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
	vAlpha = aAlpha;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vec4(1, 1, 1, texture2D(uTexture0, vTexCoord).a * vAlpha);
}
#endif

