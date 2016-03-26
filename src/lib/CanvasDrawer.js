// Generated by CoffeeScript 1.10.0
(function() {
  var CanvasDrawer, GLProgramFactory;

  GLProgramFactory = require('./shaders/GLProgramFactory');

  module.exports = CanvasDrawer = (function() {
    function CanvasDrawer(canvas, fragSource, vertSource) {
      var GL, error, error1, factory, program;
      try {
        this.canvas = canvas;
        this.GL = canvas.getContext("webgl", {
          antialias: false
        });
        GL = this.GL;
        factory = new GLProgramFactory();
        console.log("GREETINGS");
        console.log(factory.constructProgramFromSources);
        program = factory.constructProgramFromSources(GL, fragSource, vertSource);
        console.log("GOODBYE");
        this.program = program;
        this.triangleArray = [-1.0, 1.0, 1.0, -1.0, 1.0, 1.0];
        this.triangleVertex = GL.createBuffer();
        GL.bindBuffer(GL.ARRAY_BUFFER, this.triangleVertex);
        GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(this.triangleArray), GL.STATIC_DRAW);
        this.triangleFacesArray = [0, 1, 2];
        this.triangleFaces = GL.createBuffer();
        GL.bindBuffer(GL.ELEMENT_ARRAY_BUFFER, this.triangleFaces);
        GL.bufferData(GL.ELEMENT_ARRAY_BUFFER, new Uint16Array(this.triangleFacesArray), GL.STATIC_DRAW);
        this.position = GL.getAttribLocation(this.program, "position");
        GL.enableVertexAttribArray(this.position);
        console.log(this.triangleFaces);
        GL.clearColor(0.5, 0.5, 0.5, 0.5);
        this.GL.useProgram(this.program);
      } catch (error1) {
        error = error1;
        console.log(error);
      }
    }

    CanvasDrawer.prototype.drawFrame = function() {
      var GL;
      GL = this.GL;
      this.GL.viewport(0.0, 0.0, this.canvas.width, this.canvas.height);
      this.GL.clear(this.GL.COLOR_BUFFER_BIT);
      this.GL.bindBuffer(this.GL.ARRAY_BUFFER, this.triangleVertex);
      this.GL.vertexAttribPointer(this.position, 2, this.GL.FLOAT, false, 8, 0);
      this.GL.bindBuffer(this.GL.ELEMENT_ARRAY_BUFFER, this.triangleFaces);
      this.GL.drawElements(this.GL.TRIANGLES, 3, this.GL.UNSIGNED_SHORT, 0);
      this.GL.flush();
      return window.requestAnimationFrame((function(_this) {
        return function() {
          return _this.drawFrame();
        };
      })(this));
    };

    return CanvasDrawer;

  })();

}).call(this);