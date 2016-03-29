GLProgramFactory = require './shaders/GLProgramFactory'
module.exports =
class CanvasDrawer
  constructor: (canvas,fragSource, vertSource) ->
    try
      @canvas = canvas
      @GL = canvas.getContext "webgl", {antialias: false}
      GL = @GL
      factory = new GLProgramFactory()
      console.log "GREETINGS"
      console.log factory.constructProgramFromSources
      program = factory.constructProgramFromSources GL, fragSource, vertSource
      console.log "GOODBYE"
      @program = program
      @triangleArray =
      [ -1.0, 1.0,
        1.0, -1.0,
        1.0, 1.0
        -1.0, -1.0]
      @triangleVertex = GL.createBuffer()
      GL.bindBuffer GL.ARRAY_BUFFER, @triangleVertex
      GL.bufferData GL.ARRAY_BUFFER, new Float32Array(@triangleArray),
        GL.STATIC_DRAW
      @triangleFacesArray = [0,1,2,0,1,3]
      @triangleFaces = GL.createBuffer()
      GL.bindBuffer GL.ELEMENT_ARRAY_BUFFER, @triangleFaces
      GL.bufferData GL.ELEMENT_ARRAY_BUFFER, new Uint16Array(@triangleFacesArray),
        GL.STATIC_DRAW
      @position = GL.getAttribLocation @program, "position"
      GL.enableVertexAttribArray @position
      console.log @triangleFaces
      GL.clearColor 0.5,0.5,0.5,0.5
      @GL.useProgram @program
      @time = GL.getUniformLocation @program, "utime"
      @timev = 0.0
    catch error
      console.log error

  drawFrame: ->
    GL = @GL
    @timev = @timev + 0.01
    @GL.viewport 0.0, 0.0, @canvas.width, @canvas.height
    @GL.clear @GL.COLOR_BUFFER_BIT
    @GL.bindBuffer @GL.ARRAY_BUFFER, @triangleVertex
    @GL.vertexAttribPointer @position, 2, @GL.FLOAT, false, 8, 0
    @GL.uniform1f @time, @timev
    @GL.bindBuffer @GL.ELEMENT_ARRAY_BUFFER, @triangleFaces
    @GL.drawElements @GL.TRIANGLES, 6, @GL.UNSIGNED_SHORT, 0


    @GL.flush()
    window.requestAnimationFrame () => this.drawFrame()
