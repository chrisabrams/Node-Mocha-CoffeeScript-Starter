{EventEmitter} = require 'events'

class Machine
  @emitter = new EventEmitter
  constructor: ->
    @states = []
    @initialstate = null
  addState: (state) ->
    @states.push state
  setInitialState: (@initialstate) ->
  run: () ->
    @emitter.emit 'run'
  stop: () ->
    @emitter.emit 'stop'


module.exports.Machine = Machine
