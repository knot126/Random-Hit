#define BLUR 0.008

uniform mat4 uMvpMatrix;
uniform sampler2D uTexture0;

varying vec2 vTexCoord;

#ifdef VERTEX
attribute vec3 aPosition;
attribute vec2 aTexCoord;
void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);
	vTexCoord = aTexCoord;
} 
#endif

#ifdef FRAGMENT
void main(void) 
{
	float blur = texture2D(uTexture0, vTexCoord).a;
    gl_FragColor = texture2D(uTexture0, vTexCoord)*0.2;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*-3.1))*0.1;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*-2.4))*0.1;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*-1.0))*0.2;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*1.4))*0.2;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*2.1))*0.1;
    gl_FragColor += texture2D(uTexture0, vTexCoord + vec2(0.0, blur*BLUR*2.8))*0.1;

	//This was done in dof.glsl before, but faster here (lower res)
	gl_FragColor.a *= 3.0;
}
#endif

