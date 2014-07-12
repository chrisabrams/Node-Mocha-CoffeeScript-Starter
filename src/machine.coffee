{EventEmitter} = require 'events'
Bacon = require 'baconjs'

class Machine
  constructor: ->
    @emitter = new EventEmitter
    @states = []
    @initialstate = null
  addState: (state) ->
    @states.push state
  setInitialState: (@initialstate) ->
  run: () ->
    @emitter.emit 'started'
  stop: () ->
    @emitter.emit 'stopped'


module.exports.Machine = Machine
