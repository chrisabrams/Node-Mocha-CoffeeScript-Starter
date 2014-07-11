{EventEmitter} = require 'events'

class State
  constructor: () ->
    @emitter = new EventEmitter
    @initialState = false
    @finalState = false
  isFinal: ->
    return @finalState
  isInitial: ->
    return @initialState
  enter: ->
    @emitter.emit 'enter'
  onEnter:(evt) ->
    @emitter.addListener 'enter', evt
  exit: ->
    @emitter.emit 'exit'
  onExit:(evt) ->
    @emitter.addListener 'exit', evt
  addTransition: (transition) ->
    true

class FinalState extends State
  constructor: () ->
    super()
    @initialState = false
    @finalState = true
  exit: () ->
    throw new Error 'E_EXIT'

class InitialState extends State
  constructor: () ->
    super()
    @initialState = true
    @finalState = false
  enter: () ->
    throw new Error 'E_ENTER'

module.exports.State = State
module.exports.InitialState = InitialState
module.exports.FinalState = FinalState
