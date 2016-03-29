// Generated by CoffeeScript 1.10.0
(function() {
  var CanvasDrawer, ShaderReader, body, main, resizeCanvas;

  ShaderReader = require('./lib/shaders/ShaderReader');

  CanvasDrawer = require('./lib/CanvasDrawer');

  console.log("Hello");

  main = function() {
    var canvas, frag, frags, vert, verts;
    resizeCanvas();
    frag = new ShaderReader("frag");
    frags = frag.toString();
    vert = new ShaderReader("vert");
    verts = vert.toString();
    console.log(frags);
    console.log(verts);
    console.log("UPPPPP");
    canvas = document.getElementById("gl_canvas");
    this.canvasDrawer = new CanvasDrawer(canvas, verts, frags);
    this.canvasDrawer.drawFrame();
    return null;
  };

  resizeCanvas = function() {
    var canvas, div, p, w;
    div = document.getElementById("p_holder");
    p = document.getElementById("canvas_holder");
    canvas = document.getElementById("gl_canvas");
    p.width = div.innerWidth;
    p.height = div.innerHeight;
    w = getComputedStyle(p).getPropertyValue("width");
    w = parseInt(w.replace("px", "")) * 0.8;
    canvas.width = w;
    canvas.height = window.innerHeight * 0.8;
    console.log("CanvasSize:" + [canvas.width, canvas.height]);
    return [canvas.width, canvas.height];
  };

  body = document.body;

  window["main"] = (function(_this) {
    return function() {
      return main();
    };
  })(this);

  window["resizeCanvas"] = (function(_this) {
    return function() {
      return resizeCanvas();
    };
  })(this);

}).call(this);
