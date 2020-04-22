uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform vec4 uColor;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec4 vColor;
varying vec2 vTexCoord;
varying float vShadow;
varying vec4 vFog;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	float nearPlane = 0.4;
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+nearPlane) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vColor =  vec4(aColor.rgb, 0.5) * (2.0 * (1.0-fog));
	vFog = fogColor * fog;

	vShadow = 1.0-aColor.a;
	vTexCoord = aTexCoord;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	float light = (1.0-vShadow*vShadow);
	gl_FragColor = texture2D(uTexture0, vTexCoord) * vColor * light + vFog;
}
#endif

