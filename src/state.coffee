{EventEmitter} = require 'events'
Unique = require '../src/unique'

class State extends Unique
  constructor: () ->
    super()
    @initialState = false
    @finalState = false
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
    this.emit 'enter'
  ###*
   * Add a event handler to the enter method
   * method onEnter
  ###
  onEnter:(evt) ->
    this.on 'enter', evt
  ###*
   * Exit the State
   *
   * Events
   * * exit fired when the state is exited
   * @method enter
   * @return {Boolean} final Is this final
  ###
  exit: ->
    this.emit 'exit'
  onExit:(evt) ->
    this.on 'exit', evt
  addTransition: (transition) ->
    true

class FinalState extends State
  constructor: () ->
    super()
    @initialState = false
    @finalState = true
  exit: () ->
    throw new Error 'E_EXIT'

class InitialState extends State
  constructor: () ->
    super()
    @initialState = true
    @finalState = false
  enter: () ->
    throw new Error 'E_ENTER'

module.exports.State = State
module.exports.InitialState = InitialState
module.exports.FinalState = FinalState
