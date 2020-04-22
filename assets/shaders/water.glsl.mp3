#define LIGHT_DIR normalize(vec3(0.1, 1.0, 0.1))
#define SPEC_MAGNITUDE 1.0
#define SPEC_EXPONENT 700.0
#define BUMP_SCALE 0.5
#define BUMP_MAGNITUDE 1.0
#define NORMAL_SCALE 1.0
#define NEAR_PLANE 0.4

uniform mat4 uMvpMatrix;
uniform mat4 uObjectMatrix;
uniform vec2 uSize;
uniform vec3 uCameraPos;
uniform sampler2D uTexture0;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec4 vColor;
varying vec4 vFog;
varying vec2 vScreenTexCoord;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec3 aNormal;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);
	
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+NEAR_PLANE) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	
	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vFog = fogColor * fog;

	vColor = vec4(1,1,1,1);
	vColor *= (1.0-fog);

	vec3 n = normalize(aNormal*NORMAL_SCALE);
	vec3 toVertex = aPosition-uCameraPos;
	vec3 refCam = aPosition + toVertex - n*(2.0*dot(n,toVertex));
	vec4 p = uMvpMatrix * vec4(refCam, 1.0);
	vScreenTexCoord = p.xy/vec2(p.z+NEAR_PLANE, p.z+NEAR_PLANE)*vec2(0.49, 0.49) + vec2(0.5, 0.5);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 ref = texture2D(uTexture0, vScreenTexCoord);
	gl_FragColor = (vec4(0.9, 0.97, 1.0, 0.7)*ref)*vColor + vFog;
}
#endif

