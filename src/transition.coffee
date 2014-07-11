{EventEmitter} = require 'events'

class Transition
  setTargetState: (@targetState, @evaluate = ->) ->
    true
  evaluate: () ->
    if @evaluate()
      return @targetState
    else
      return false

class StringTransition extends Transition
  constructor: (@string) ->

  evaluate:(value) ->
    return value == @string

module.exports.Transition = Transition
module.exports.StringTransition = StringTransition
