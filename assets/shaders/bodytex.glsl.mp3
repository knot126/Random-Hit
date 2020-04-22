uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying lowp vec4 vColor;
varying lowp vec4 vFog;
varying vec2 vTexCoord0;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTexCoord;
attribute lowp vec4 aColor;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	vec3 normal = aNormal;
	float light = 0.85 + 0.15*dot(normalize(vec3(-0.1, 1.0, 0.3)), normal);
	//light += 0.9*pow(light, 8.0);
	light = clamp(light, 0.0, 1.0);
	float g = 0.7*pow(light, 90.0);
	light = max(0.6, light*0.9);

	float nearPlane = 0.4;
	vec4 upperFog = uUpperFog;
	vec4 lowerFog = uLowerFog;
	float t = gl_Position.y / (gl_Position.z+nearPlane) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vColor =  vec4(aColor.rgb, 0.5) * (light * 2.0 * (1.0-fog));
	vFog = fogColor * fog;
	
	vTexCoord0 = aTexCoord * 1.0;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = texture2D(uTexture0, vTexCoord0) * vColor + vFog;
}
#endif

