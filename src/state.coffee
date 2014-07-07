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
    @emitter.emit('enter')
  onEnter:(evt) ->
    @emitter.addListener 'enter', evt

class FinalCState extends CState
  constructor: () ->
    @initialState = false
    @finalState = true
  
class InitialCState extends CState
  constructor: () ->
    @initialState = true
    @finalState = false

module.exports.CState = CState
module.exports.InitialCState = InitialCState
module.exports.FinalCState = FinalCState