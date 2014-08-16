Unique = require '../src/unique'
Bacon = require 'baconjs'

###*
 * A state machine
 *
 * @class Machine A state machine
 *
 * .h3 Example
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
    # inherit all the good that Unique gave us
    super()
    # store the sttes in this
    @states = {}
    # the initial state Id
    @initialState = undefined
    @stream = Bacon.fromEventTarget this, 'stat'

  ###*
   * Add a State to the state machine
   * @method addState
  ###
  addState: (state) ->
    # emit a eveent when a state is added.
    # This avoids the need to extend addState
    @emit 'state_added', {
      uuid: state.getUuid()
      event: 'state_added'
    }
    # we need to get the ID frim the state so that we can store stuff
    stateId = state.getUuid()
    @states[stateId] = state
    # subscribe the stream of the event to the bus
    # so wen can listen to everything on one bus
    stateStream = state.getStream()
    @stream.merge stateStream
    @stream.onValue (value) ->
      console.log value
  ###*
   * Set the initial state for the state machine
   * @method setInitialState
  ###
  setInitialState: (initialState) ->
    # we need to get the ID frim the state so that we can store stuff
    uuid = initialState.getUuid()
    # add the state if this has not yet happened
    @addState initialState
    # set the uuid
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
      ###*
       *
       * h3. Example:fff
       *
       *```
       *  machine.on -> true
       *```
      ###
    evt = { states: Object.keys @states }
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
