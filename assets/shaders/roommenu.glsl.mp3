#define NEAR_PLANE 0.4

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

	float t = gl_Position.y / (gl_Position.z+NEAR_PLANE) * 0.5 + 0.5;
	vec4 fogColor = mix(uLowerFog, uUpperFog, t);
	fogColor.a = uColor.a;

	vShadow = 1.0-aColor.a;
	float fog = clamp(0.035 * (-55.0 + gl_Position.z), 0.0, 1.0);
	vColor =  vec4(aColor.rgb * uColor.rgb, 0.5) * (2.0 * (1.0-fog));
	vColor.a *= uColor.a;
	vFog = fogColor * fog;
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

