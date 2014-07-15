Unique = require '../src/unique'

###*
 * A state machine
 *
 * @class Machine A state machine
 *
 * h3 Example:fff
 *
 *```
 *  javascript
 *  s1 = new State
 *  s2 = new State
 *  t1 = new StringTransition 'Hello'
 *  t2 = new StringTransition 'world'
 *  machine = new Machine
 *  machine.addState s1
 *  machine.addState s2
 *  machine.addState done
 *```
###
class Machine extends Unique
  constructor: ->
    super()
    @states = {}
    @initialState = undefined

  ###*
   * Add a State to the state machine
   * @method addState
  ###
  addState: (state) ->
    @emit 'state_added', {uuid: state.getUuid() }
    # assign the state to a internal var
    stateId = state.getUuid()
    @states[stateId] = state

  ###*
   * Set the initial state for the state machine
   * @method setInitialState
  ###
  setInitialState: (initialState) ->
    uuid = initialState.getUuid()
    @addState initialState
    @initialState = uuid
  ###*
   * Start the state machine and trigger the initial state
   * * started
   *
   * @method run
  ###
  run: () ->
    if (!@initialState)
      throw new Error 'E_INITIAL_STATE'
    evt = {states: Object.keys @states}
    @emit 'started', evt
    # a first attempt to exit this state by firing the exit method
    # this will trigger the mechanism a first time
    state = @states[@initialState]
    true
  ###*
   * Stop this state machine
   * @method stop
   * Events
   * * stopped
  ###
  stop: () ->
    this.emit 'stopped'

module.exports.Machine = Machine
