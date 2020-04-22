uniform mat4 uMvpMatrix;
uniform vec4 uColor;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying lowp vec4 vCol;

#ifdef VERTEX
attribute vec3 aPosition;
attribute lowp vec4 aColor;

void main(void)
{
	vCol = aColor;
	vec3 p = aPosition;
	p.y = min(0.0, -p.y);
	gl_Position = uMvpMatrix * vec4(p, 1.0);

	float nearPlane = 0.4;
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+nearPlane) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);

	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vCol =  vec4(aColor.rgb, 1.0) * (1.0-fog) + fogColor * fog;
	vCol.a = 0.2 + p.y*0.2;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vCol;
}
#endif

