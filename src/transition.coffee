{EventEmitter} = require 'events'

class Transition

  setTargetState: (@targetState, @evl) ->
    true
  evaluate: (cb) ->
    return cb()

class StringTransition extends Transition
  constructor: (@string) ->

  evaluate:(value) ->
    return value == @string

module.exports.Transition = Transition
module.exports.StringTransition = StringTransition
