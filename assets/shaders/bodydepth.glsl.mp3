uniform mat4 uMvpMatrix;

#ifdef VERTEX
attribute vec3 aPosition;

void main(void)
{
	gl_Position = uMvpMatrix * vec4(aPosition, 1.0);
}
#endif

#ifdef FRAGMENT
void main(void) 
{
}
#endif

