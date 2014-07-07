__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

{CState, FinalCState, InitialCState} = require '../../src/state'

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
  it 'has a enter method', () ->
    state = new CState
    expect(state).to.respondTo 'enter'
    expect(state).to.respondTo 'onEnter'
  it 'sends a enter evt.vent', (done) ->
    state = new CState
    foo = (bar) ->
      done()
    # use a event on enter so that others can listen to it
    state.onEnter foo
    # enter the state, test fails with a timeout if done is not called 
    state.enter()

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
