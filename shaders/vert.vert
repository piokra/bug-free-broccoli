attribute vec2 position;
varying vec2 vpos;
void main(void)
{
  vpos = position;
  gl_Position = vec4(position, 0., 1.);
}
