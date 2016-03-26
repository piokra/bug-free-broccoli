module.exports =
class GLProgramFactory
  constructor: () ->
    console.log "hello"
  constructShader: (GL, source, type) ->
    shader = GL.createShader(type)
    GL.shaderSource(shader,source)
    GL.compileShader(shader)
    if (!GL.getShaderParameter(shader, GL.COMPILE_STATUS))
      console.log "Failed to compiled Shader."
      console.log GL
      console.log source
      console.log type
      return null
    return shader

  constructProgramFromShaders: (GL, __vert, __frag) ->
    program = GL.createProgram()
    GL.attachShader program, __vert
    GL.attachShader program, __frag

    GL.linkProgram program

    GL.validateProgram program
    console.log GL.getProgramInfoLog program
    console.log GL.getProgramParameter program, GL.VALIDATE_STATUS
    console.log "^^"
    return program

  constructProgramFromSources: (GL, __vert, __frag) ->

    vertshader = this.constructShader(GL, __vert, GL.VERTEX_SHADER)
    fragshader = this.constructShader(GL, __frag, GL.FRAGMENT_SHADER)
    return this.constructProgramFromShaders GL,
      vertshader,
      fragshader
