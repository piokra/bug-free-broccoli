ShaderReader = require './lib/shaders/ShaderReader'
CanvasDrawer = require './lib/CanvasDrawer'
console.log "Hello"
main = () ->
  resizeCanvas()
  frag = new ShaderReader("frag")
  frags = frag.toString()
  vert = new ShaderReader("vert")
  verts = vert.toString()
  console.log frags
  console.log verts
  console.log "UPPPPP"
  canvas = document.getElementById("gl_canvas")
  @canvasDrawer = new CanvasDrawer canvas, verts, frags
  @canvasDrawer.drawFrame()
  null

resizeCanvas = () ->
  div = document.getElementById("p_holder")
  p = document.getElementById("canvas_holder")
  canvas = document.getElementById("gl_canvas")
  p.width = div.innerWidth
  p.height = div.innerHeight
  w = getComputedStyle(p).getPropertyValue("width")
  w = parseInt(w.replace("px",""))*0.8
  canvas.width = w
  canvas.height = window.innerHeight*0.8
  console.log [canvas.width, canvas.height]
  [canvas.width, canvas.height]



body = document.body
window["main"] = () => main()
window["resizeCanvas"] = () => resizeCanvas()
