__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

{State, FinalState, InitialState} = require '../../src/state'
{Transition} = require '../../src/transition'

describe 'State', ->
  it 'should exist', (done) ->
    expect(typeof State).to.equal 'function'
    done()
  it 'should be able to create an instance', (done) ->
    expect(typeof new State).to.equal 'object'
    done()
  it 'is not final', (done) ->
    state = new State
    expect(state.isFinal()).to.be.false
    done()
  it 'has a enter and OnEnter Method', () ->
    state = new State
    expect(state).to.respondTo 'enter'
    expect(state).to.respondTo 'onEnter'
  it 'sends a enter evt', (done) ->
    state = new State
    cb = (bar) ->
      done()
    # use a event on enter so that others can listen to it
    state.onEnter cb
    # enter the state, test fails with a timeout if done is not called
    state.enter()
  it 'sends a exit evt', (done) ->
    state = new State
    cb = (bar) ->
      done()
    # use a event on enter so that others can listen to it
    state.onExit cb
    # enter the state, test fails with a timeout if done is not called
    state.exit()
  it 'adds a transition', ->
    state = new State
    stateTo = new State
    expect(state.addTransition(stateTo)).to.be.true

describe 'Final State', ->
  it 'should be final', (done) ->
    state = new FinalState
    expect(state.isFinal()).to.be.true
    done()
  it 'should not be initial', (done) ->
    state = new FinalState
    expect(state.isInitial()).to.be.false
    done()
  it 'should error on a call to .exit', (done) ->
    state = new FinalState
    expect(-> state.exit()).to.throw('E_EXIT')
    done()

describe 'Initial State', ->
  it 'should not be final', (done) ->
    state = new InitialState
    expect(state.isFinal()).to.be.false
    done()
  it 'should  be initial', (done) ->
    state = new InitialState
    expect(state.isInitial()).to.be.true
    done()
  it 'should error on a call to .enter', (done) ->
    state = new InitialState
    expect(-> state.enter()).to.throw('E_ENTER')
    done()

