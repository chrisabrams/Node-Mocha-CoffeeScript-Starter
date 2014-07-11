
class Machine
  constructor: ->
    @states = []
    @initialstate = null
  addState: (state) ->
    @states.push state
  setInitialState: (@initialstate) ->
module.exports.Machine = Machine