Unique = require '../src/unique'
###*
 * A State
 *
 * @class State
 *
 * h3 Example:
 *
 *     state = new State
 *     state.addTransition new Transition
###
class State extends Unique
  constructor: () ->
    super()
    @initialState = false
    @finalState = false
    @tansitions = {}
  ###*
   * Check if it this is a final state
   * @method isFinal
   * @return {Boolean} final Is this final
  ###
  isFinal: ->
    return @finalState
  ###*
   * Check if this is a initial state
   * @method isInitial
   * @return {Boolean} final Is this final
  ###
  isInitial: ->
    return @initialState
  ###*
   * Enter this state
   *
   * Events
   * * enter fired when the state is entered
   * @method enter
  ###
  enter: ->
    @emit 'enter'
    true
  ###*
   * Exit the State
   *
   * Events
   * * exit fired when the state is exited
   * @method enter
   * @return {Boolean} final Is this final
  ###
  exit: ->
    @emit 'exit'
  ###*
   * Add a transition
   *
   * .h3 Events
   * * transition_add fired when the transition is addeed
   * @method addTransition
   * @return {Boolean}
  ###
  addTransition: (transition) ->
    transitionId = transition.getUuid()
    @tansitions[transitionId] = transition
    true
  removeTransition: (transition) ->
    transitionId = transition.getUuid()
    delete @tansitions[transitionId]

###*
 * A final state. This is the end of a fsm process
 * It can not transition to another state
 *
 * @class FinalState
 *
 * h3 Example:
 *
 *     state = new FinalState
###
class FinalState extends State
  constructor: () ->
    super()
    @initialState = false
    @finalState = true
  ###*
   * Exit the state
   * This methdod throws an exception. A final State is
   * final and does not need to be exited aka transitioned
   * to another state
   *
   * @method enter
   * @throws E_EXIT
  ###
  exit: () ->
    throw new Error 'E_EXIT'

###*
 * A initial state. This is the end of a fsm process
 *
 * @class InitialState
 *
 * h3 Example:
 *
 *     state = new InitialState
 *     state.addTransition new Tansition
###
class InitialState extends State
  constructor: () ->
    super()
    @initialState = true
    @finalState = false
  ###*
   * Enter the state
   * This methdod throws an exception. A initial State is
   * initial and does not need to be entered aka transitioned
   * to
   *
   * @method enter
   * @throws E_ENTER
  ###
  enter: () ->
    throw new Error 'E_ENTER'

module.exports.State = State
module.exports.InitialState = InitialState
module.exports.FinalState = FinalState
