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
  it 'sends a enter evt', (done) ->
    state = new CState
    cb = (bar) ->
      done()
    # use a event on enter so that others can listen to it
    state.onEnter cb
    # enter the state, test fails with a timeout if done is not called 
    state.enter()
  it 'sends a exit evt', (done) ->
    state = new CState
    cb = (bar) ->
      done()
    # use a event on enter so that others can listen to it
    state.onExit cb
    # enter the state, test fails with a timeout if done is not called 
    state.exit()
  it 'adds a transition', ->
    state = new CState
    stateTo = new CState
    expect(state.addTransition(stateTo)).to.be.true

describe 'Final CState', ->
  it 'should be final', (done) ->
    state = new FinalCState
    expect(state.isFinal()).to.be.true
    done()
  it 'should not be initial', (done) ->
    state = new FinalCState
    expect(state.isInitial()).to.be.false
    done()
  it 'should error on a call to .exit', (done) ->
    state = new FinalCState
    expect(-> state.exit()).to.throw()
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
