uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform sampler2D uTexture1;

varying float vBlur;

#ifdef VERTEX
attribute vec3 aPosition;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	float nearBlur = clamp((gl_Position.z-1.0)/3.0, 0.0, 1.0);
	nearBlur = (1.0 - nearBlur);
	nearBlur *= nearBlur;
	vBlur = nearBlur;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vec4(1.0, 1.0, 1.0, vBlur);
}
#endif

