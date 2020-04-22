uniform mat4 uMvpMatrix;
uniform vec4 uColor;

#ifdef VERTEX
attribute vec3 aPosition;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition.xyz, 1.0);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
	gl_FragColor = uColor;
}
#endif

