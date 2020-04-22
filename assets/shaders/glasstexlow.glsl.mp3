#define LIGHT_DIR vec3(-0.34815531, 0.34815531, 0.87038828)
#define SPEC_MAGNITUDE 1.0
#define SPEC_EXPONENT 70.0
#define BUMP_SCALE 3.0
#define BUMP_MAGNITUDE 1.0
#define NEAR_PLANE 0.4

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
varying float vSpec;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	vec3 normal = aNormal;
	float light = 0.8 + 0.2*dot(LIGHT_DIR, normal);
	light = clamp(light, 0.8, 1.0);
	vCol = aColor * (light + aColor.a);

	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+NEAR_PLANE) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vCol *=  (1.0-fog);
	vFog = fogColor * fog;

	vSpec = (1.0-fog) * SPEC_MAGNITUDE;
	
	vTexCoord0 = aTexCoord;
	vDisplaceMagnitude = 2.0/(1.0+gl_Position.z) * 0.5;

	vScreenTexCoord = gl_Position.xy/vec2(gl_Position.z+NEAR_PLANE, gl_Position.z+NEAR_PLANE)*vec2(0.49, 0.49) + vec2(0.5, 0.5);
	vNormal = normal;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 tex = texture2D(uTexture0, vTexCoord0);
	vec3 n = normalize(vNormal);
	float light = max(0.0, dot(LIGHT_DIR, n));
	float spec = SPEC_MAGNITUDE*pow(light, SPEC_EXPONENT);
	spec = min(1.0, spec) * vSpec;
	vec4 col = vCol + vec4(spec, spec, spec, 0.0);

	vec2 displace = n.xy * vDisplaceMagnitude;
	vec4 bgColor = texture2D(uTexture1, vScreenTexCoord + displace);
	bgColor.rgb = bgColor.rgb * (1.0-tex.a) + tex.rgb * tex.a;
	gl_FragColor = bgColor * col + vFog;
}
#endif

