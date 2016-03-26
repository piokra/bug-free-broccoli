module.exports =
class ShaderReader
  constructor: (id) ->
    try
      shader = document.getElementById(id)
      @shaderSource = shader.getAttribute("shader_text")
      @success = yes
    catch error
      console.log error
      @success = no
  didSucced: ->
    @success

  toString: ->
    if this.didSucced()
      return @shaderSource
    null
