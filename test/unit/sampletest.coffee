__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

describe 'Smaple Test', ->

    it 'should be able to run a test', (done) ->
      done()

    it 'should be able to assert a value', (done) ->
      a = 1
      expect(a).to.equal 1
      done()

    it 'should be able to test an async operation', (done) ->

      # This funcion simply exectutes a callback
      myTestFunc = (callback) ->
        callback()

      # The function is run, and done() is performed inside the callback.
      myTestFunc () ->
        done()

describe 'CState', ->
  it 'should exist', (done) ->
    expect(typeof CState).to.equal 'function'
    done()
  it 'should be able to create an instance', (done) ->
    expect(typeof new CState).to.equal 'object'
    done()
  it 'is not final', (done) ->
    state = new CState
    expect(state.isFinal()).to.be.false
    done()

describe 'Final CState', ->
  it 'should be final', (done) ->
    state = new FinalCState
    expect(state.isFinal()).to.be.true
    done()
  it 'should not be initial', (done) ->
    state = new FinalCState
    expect(state.isInitial()).to.be.false
    done()


describe 'Initial CState', ->
  it 'should not be final', (done) ->
    state = new InitialCState
    expect(state.isFinal()).to.be.false
    done()
  it 'should  be initial', (done) ->
    state = new InitialCState
    expect(state.isInitial()).to.be.true
    done()
  it 'should  not be final', (done) ->
    state = new InitialCState
    expect(state.isFinal()).to.be.false
    done()

class CState
  constructor: () ->
    @initialState = false
    @finalState = false;
  isFinal: ->
    return @finalState
  isInitial: ->
    return @initialState

class FinalCState extends CState
  @initialState = false
  @finalState = true
  
class InitialCState extends CState
  @initialState = true
  @finalState = false
