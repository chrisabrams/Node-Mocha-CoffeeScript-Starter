class CState
  constructor: () ->
    @initialState = false
    @finalState = false;
  isFinal: ->
    return @finalState
  isInitial: ->
    return @initialState
  enter: ->
    true
  onEnter:() ->
    true


class FinalCState extends CState
  constructor: () ->
    @initialState = false
    @finalState = true
  
class InitialCState extends CState
  constructor: () ->
    @initialState = true
    @finalState = false

module.exports.CState = CState
module.exports.InitialCState = InitialCState
module.exports.FinalCState = FinalCState