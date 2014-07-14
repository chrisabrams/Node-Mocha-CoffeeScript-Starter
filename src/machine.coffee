Unique = require '../src/unique'

###*
 * A Transition from one state to another
 *
 * @class Machine A state machine
 *
 * h3 Example:fff
 *
 *```javascript
 *    s1 = new State
 *    s2 = new State
 *    t1 = new StringTransition 'Hello'
 *    t2 = new StringTransition 'world'
 *    machine = new Machine
 *    machine.addState s1
 *    machine.addState s2
 *    machine.addState done
 *```
###
class Machine extends Unique
  constructor: ->
    super()
    @states = {}
    @initialstate = null

  ###*
   * Add a State to the state machine
   * @method addState
  ###
  addState: (state) ->
    stateId = state.getUuid()
    @states[stateId] = state

  ###*
   * Set the initial state for the state machine
   * @method setInitialState
  ###
  setInitialState: (@initialstate) ->
  ###*
   * Start the state machine and trigger the initial state
   * method run
   * h3 Events
   * * started
  ###
  run: () ->
    this.emit 'started', {states: Object.keys @states}
    true
  ###*
   * Stop this state machine
   * @method stop
   * h3 Events
   * * stopped
  ###
  stop: () ->
    this.emit 'stopped'


module.exports.Machine = Machine
