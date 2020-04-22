#define NEAR_PLANE 0.4

uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform sampler2D uTexture1;
uniform vec4 uLowerFog;
uniform vec4 uUpperFog;

varying vec4 vColor;
varying vec2 vScreenTexCoord;
varying vec2 vTexCoord;
varying vec3 vNormal;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec3 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);

	vTexCoord = aTexCoord.xy;
	vTexCoord.y = 1.0 - vTexCoord.y;
	vScreenTexCoord = gl_Position.xy/vec2(gl_Position.z+NEAR_PLANE, gl_Position.z+NEAR_PLANE)*vec2(0.25, 0.25) + vec2(0.5, 0.5);
	vNormal = aTexCoord;
	vNormal.x = vNormal.x*2.0 - 1.0;
	vNormal.y = vNormal.y*2.0 - 1.0;
	vNormal.z *= 3.0;

	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	vColor = aColor;
	vColor.a *= (1.0-fog);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec3 normal = normalize(vNormal);
	vec4 b = texture2D(uTexture0, vTexCoord);
	vec4 c = texture2D(uTexture1, vScreenTexCoord + normal.xy*0.5);
	c.rgb *= vColor.rgb;
	c = c*b.x;
	c = c + vec4(b.g, b.g, b.g, 0.0);
	c.a = b.a * vColor.a;
	gl_FragColor = c;
}
#endif

