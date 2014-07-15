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
    @initialState = null

  ###*
   * Add a State to the state machine
   * @method addState
  ###
  addState: (state) ->
    console.log 'addState'
    state.on 'enter', (evt)->
      @emit 'state:enter', evt
    # assign the state to a internal var
    stateId = state.getUuid()
    @states[stateId] = state

  ###*
   * Set the initial state for the state machine
   * @method setInitialState
  ###
  setInitialState: (@initialState) ->
  ###*
   * Start the state machine and trigger the initial state
   * method run
   * h3 Events
   * * started
  ###
  run: () ->
    this.emit 'started', {states: Object.keys @states}
    if (!@initialState)
      throw new Error 'E_INITIAL_STATE'

    @initialState.enter()
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
