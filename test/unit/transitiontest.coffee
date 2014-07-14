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
  it 'should have a Uuid', (done) ->
    t1 = new Transition
    expect(t1.getUuid().toString().length).to.be.equal 36
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
    it 'should fire a triggered when evaluate is triggered', (done) ->
      t1 = new StringTransition 'Foo'
      t1.on 'transition', ->
        done()
      expect(t1.evaluate('Foo')).to.be.true
    it.skip 'should fire a transition event when it is doing one', (done) ->

