{EventEmitter} = require 'events'

class Transition
  setTargetState: (@targetState, @evaluate = ->) ->
    true
  evaluate: () ->
  	if evaluate()
  	  return @targetState
  	else 
  	  return false

class StringTransition extends Transition
  constructor: (@topic) ->
  
  evaluate:(value) ->
  	return value eq @topic

module.exports.Transition = Transition
module.exports.StringTransition = StringTransition