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
	float spec = SPEC_MAGNITUDE*pow(light, SPEC_EXPONENT);
	vCol = aColor * (light + aColor.a + spec);


	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+NEAR_PLANE) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vCol *=  (1.0-fog);
	vFog = fogColor * fog;
	vCol.a = 0.5 + 0.5*spec;

	vTexCoord0 = aTexCoord;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	float c = texture2D(uTexture0, vTexCoord0).r + 0.3;
	gl_FragColor = vCol * vec4(c,c,c,1.0) + vFog;
}
#endif

