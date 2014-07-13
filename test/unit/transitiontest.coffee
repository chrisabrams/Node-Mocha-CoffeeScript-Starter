__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

{State, FinalState, InitialState} = require '../../src/state'
{Transition, StringTransition} = require '../../src/transition'

describe 'Transition', (done) ->
  it 'should exist', (done) ->
    expect(Transition).to.be.a 'function'
    done()
  it 'should instantiate', (done) ->
    expect(new Transition).to.be.a 'object'
    done()
  it 'should not evaluate when not set up ', (done) ->
    t1 = new Transition
    expect(t1.evaluate()).to.be.false
    done()

  it 'should  evaluate when  set up ', (done) ->
    t1 = new Transition
    expect(t1.evaluate(-> true)).to.be.true
    done()

  describe 'StringTransition', ->
    it 'should exist', (done) ->
      expect(StringTransition).to.be.a 'function'
      done()
    it 'should create an instance', (done) ->
      expect(new StringTransition).to.be.a 'object'
      done()
    it 'evaluate successfully with correct input', (done) ->
      t1 = new StringTransition 'Hello'
      expect(t1.evaluate 'Hello').to.be.true
      done()
    it 'dont evaluate with wrong input', (done) ->
      t1 = new StringTransition 'Hello'
      expect(t1.evaluate 'Foo').to.be.false
      done()

