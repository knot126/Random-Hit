#define NEAR_PLANE 0.4

uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform vec4 uColor;

varying vec4 vColor;
varying vec2 vTexCoord;
varying vec4 vFog;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	vec4 upperFog = vec4(-1.9, -.95, -.6, 1.0);
	vec4 lowerFog = vec4(2.3, 2.2, 2.0, 1.0);
	float t = gl_Position.y / (gl_Position.z+NEAR_PLANE) * 0.5 + 0.5;
	vec4 fogColor = mix(lowerFog, upperFog, t);
	fogColor.a = uColor.a;
	float fog = clamp(0.025 * (-40.0 + gl_Position.z), 0.0, 1.0);
	vColor =  vec4(aColor.rgb, 0.5) * (2.0 * (1.0-fog));
	vColor.a *= uColor.a * aColor.a;
	vFog = fogColor * fog;
	vTexCoord = aTexCoord;
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = texture2D(uTexture0, vTexCoord) * vColor + vFog;
}
#endif

