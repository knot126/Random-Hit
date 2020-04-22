#define LIGHT_DIR vec3(-0.34815531, 0.34815531, 0.87038828)
#define BUMP_SCALE 1.0
#define BUMP_MAGNITUDE 0.1
#define BRIGHTNESS 1.2
#define NEAR_PLANE 0.4

uniform vec3 uCameraPos;
uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform sampler2D uTexture1;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying lowp vec4 vCol;
varying vec4 vFog;
varying vec3 vNormal;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	vec3 normal = aNormal;
	float light = 0.1 + 0.9*dot(LIGHT_DIR, normal);
	light = clamp(light, 0.7, 1.0);
	vCol = aColor * light;

	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	float nearPlane = 0.4;
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+nearPlane) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);

	float fog =  clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vCol *= (1.0-fog);
	vFog = fogColor * fog;
	
	vNormal = aNormal;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = vCol + vFog;
}
#endif

