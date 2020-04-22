uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform sampler2D uTexture1;

varying vec2 vTexCoord;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);
	vTexCoord = aTexCoord;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 b0 = texture2D(uTexture0, vTexCoord);
	vec4 b1 = texture2D(uTexture1, vTexCoord);
	gl_FragColor = mix(b0, b1, b1.a);
}
#endif

