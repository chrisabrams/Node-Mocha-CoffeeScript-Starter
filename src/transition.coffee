{EventEmitter} = require 'events'
Unique = require '../src/unique'


###*
 * A Transition from one state to another
 *
 * @class Transition
 *
 * h3 Example:
 *
 *     transition = new Transition
###

class Transition extends Unique
  constructor: () ->
    super()
    @eventStream = new EventEmitter

  ###*
   * Set a target state. It will be returned upon transition or sent via a event
   * method setTargetState
  ###
  setTargetState: (@targetState, @evl) ->
    true

  ###*
   * Evaluate if a state change is possible
   * @parsam {Function} cb callback
   * @event {Event} evt
   * @return {Boolean} evaled result of cb or false if no cb was given
  ###
  evaluate: (cb) ->
    ###*
     * the base class just evaluates the given function
     *
    ###
    if cb
      return cb()
    else
      false


###*
 * A transition that checks a given string against an internal one
 * @class StringTransition
###
class StringTransition extends Transition
  ###*
   * Constructor
   * @param {String} string to check
  ###
  constructor: (@string) ->

  ###*
   * Evaluate the given param with the internal string
   * @param {String} param string to check
  ###
  evaluate:(param) ->
    # @example foo
    return param == @string

module.exports.Transition = Transition
module.exports.StringTransition = StringTransition
