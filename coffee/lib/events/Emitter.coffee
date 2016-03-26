module.exports =
class Emitter
  constructor: ->
    @EventCallbacks = { "null" : []}

  emit: (event) ->
    for callback in @EventCallbacks[event]
      callback event
  subscribe: (event, callback) ->
    @EventCallbacks[event].push event
