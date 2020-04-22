uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;
uniform vec4 uColor;

varying vec4 vFog;
varying vec2 vTexCoord;
varying vec4 vColor;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
attribute vec4 aColor;

void main(void)
{
	vTexCoord = aTexCoord;

	vec3 p = aPosition;
	p.y = min(0.0, -p.y);
	gl_Position = uMvpMatrix * vec4(p, 1.0);

	float fog = clamp(0.05 * (-5.0 + gl_Position.z), 0.0, 1.0);
	
	vColor = aColor;
	vColor.a *= (1.0-fog) * (0.2 + p.y*0.2);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	vec4 tex = texture2D(uTexture0, vTexCoord);
	gl_FragColor = tex*vColor;
}
#endif

