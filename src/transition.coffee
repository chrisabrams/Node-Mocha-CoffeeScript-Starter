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
  ###*
   * Set a target state. It will be returned upon transition or sent via a event
   * @method setTargetState
   * @param {Object} targetstate State to transition to
   * @param {Function} evl Method to be eval'ed to check if transition is ok
  ###
  setTargetState: (@targetState, @evl) ->
    @targetState

  ###*
   * Evaluate if a state change is possible
   * @param {Function} cb callback
   * @return {Boolean} evaled result of cb or false if no cb was given
  ###
  trigger: (cb) ->
    # emits a event
    this.emit 'triggered', {uuid: @uuid}
    ###*
     * the base class just evaluates the given function
    ###
    if cb
      transitionEvaluationResult = cb()
      this.emit 'transition', {uuid: @uuid, result: transitionEvaluationResult}
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
   * @method trigger
   * @param {String} param string to check
  ###
  trigger:(param) ->
    this.emit 'triggered', {uuid: @uuid}
    return param == @string

class EventTransition extends Transition
  constructor: ->
    super()
  setTargetState: (@targetState, @obj, @ebentName) ->


module.exports.Transition = Transition
module.exports.StringTransition = StringTransition
module.exports.EventTransition = EventTransition
