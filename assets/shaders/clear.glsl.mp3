uniform mat4 uMvpMatrix;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec4 vColor;

#ifdef VERTEX
attribute vec2 aPosition;

void main(void)
{
	gl_Position = vec4(aPosition * 2.0 - vec2(1.0, 1.0), 0.0, 1.0);
	float nearPlane = 0.4;
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y * 0.5 + 0.5;
	vColor = mix(lowerFog, upperFog, t);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vColor;
}
#endif

