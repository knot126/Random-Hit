uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;

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
	vec4 c = texture2D(uTexture0, vTexCoord)*0.5;
	c = c + texture2D(uTexture0, vTexCoord + vec2(-0.004, -0.004))*0.125;
	c = c + texture2D(uTexture0, vTexCoord + vec2(0.004, -0.004))*0.125;
	c = c + texture2D(uTexture0, vTexCoord + vec2(0.004, 0.004))*0.125;
	c = c + texture2D(uTexture0, vTexCoord + vec2(-0.004, 0.004))*0.125;
	gl_FragColor = c;
}
#endif

