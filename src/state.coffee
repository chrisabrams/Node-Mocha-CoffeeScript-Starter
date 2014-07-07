{EventEmitter} = require 'events'

class CState
  constructor: () ->
    @emitter = new EventEmitter;
    @initialState = false
    @finalState = false;
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

class FinalCState extends CState
  constructor: () ->
    super()
    @initialState = false
    @finalState = true
  exit: () ->
    throw new Error
  
class InitialCState extends CState
  constructor: () ->
    super()
    @initialState = true
    @finalState = false

module.exports.CState = CState
module.exports.InitialCState = InitialCState
module.exports.FinalCState = FinalCState