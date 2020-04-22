#define LIGHT_DIR vec3(-0.34815531, 0.34815531, 0.87038828)
#define BUMP_SCALE 1.0
#define BUMP_MAGNITUDE 0.1
#define BRIGHTNESS 1.2
#define NORMAL_SCALE 0.6
#define NEAR_PLANE 0.4

uniform vec3 uCameraPos;
uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform sampler2D uTexture1;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec2 vTexCoord0;
varying lowp vec4 vCol;
varying vec4 vFog;
varying float vDisplaceMagnitude;
varying vec2 vScreenTexCoord;
varying vec3 vNormal;
varying vec3 vDir;

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
	
	vTexCoord0 = aTexCoord;
	vDisplaceMagnitude = 2.0/(1.0+gl_Position.z);
	vNormal = normal;
	vDir = normalize(aPosition-uCameraPos);

	vScreenTexCoord = gl_Position.xy/vec2(gl_Position.z+NEAR_PLANE, gl_Position.z+NEAR_PLANE)*vec2(0.1, 0.1) + vec2(0.5, 0.5);
	vScreenTexCoord = vec2(0.5, 0.5);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec2 noise = texture2D(uTexture1, vTexCoord0*BUMP_SCALE).xy - vec2(0.5,0.5);
	vec3 n = vNormal*NORMAL_SCALE + vec3(noise*BUMP_MAGNITUDE, 0.0);
	
	n = normalize(n);
	
	vec3 refDir = normalize(vDir) - n*(2.0*dot(normalize(vDir), n));
	vec2 refCoord = vScreenTexCoord + refDir.xy*0.5;
	
	vec4 bgColor = texture2D(uTexture0, refCoord) * BRIGHTNESS;
	float c = 0.5 + 0.5*(bgColor.r+bgColor.g+bgColor.b)*0.3333;
	bgColor = 0.4*bgColor + vec4(c,c,c,1.0)*0.6;
	gl_FragColor = bgColor*vCol + vFog;
}
#endif

