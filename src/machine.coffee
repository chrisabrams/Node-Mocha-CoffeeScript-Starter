{EventEmitter} = require 'events'
###*
 * A Transition from one state to another
 *
 * @class Machine A state machine
 *
 * h3 Example:
 *
 *   s1 = new State
 *   s2 = new State
 *   t1 = new StringTransition 'Hello'
 *   t2 = new StringTransition 'world'
 *   machine = new Machine
 *   machine.addState s1
 *   machine.addState s2
 *   machine.addState done
###
class Machine
  constructor: ->
    @emitter = new EventEmitter
    @states = []
    @initialstate = null

  ###*
   * Add a State to the state machine
   * method addState
  ###
  addState: (state) ->
    @states.push state

  ###*
   * Set the initial state for the state machine
   * method setInitialState
  ###
  setInitialState: (@initialstate) ->
  ###*
   * Start the state machine and trigger the initial state
   * method run
  ###
  run: () ->
    @emitter.emit 'started'
  ###*
   * Stop this state machine
   * method stop
  ###
  stop: () ->
    @emitter.emit 'stopped'


module.exports.Machine = Machine
