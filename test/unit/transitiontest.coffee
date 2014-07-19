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
  it 'should not trigger when not set up ', (done) ->
    t1 = new Transition
    expect(t1.trigger()).to.be.false
    done()
  it 'should trigger when set up ', (done) ->
    t1 = new Transition
    expect(t1.trigger(-> true)).to.be.true
    done()
  it 'should have a Uuid', (done) ->
    t1 = new Transition
    expect(t1.getUuid().toString().length).to.be.equal 36
    done()
  it 'should fire a triggered when trigger is executed', (done) ->
    t1 = new Transition
    t1.on 'triggered', ->
      done()
    expect(t1.trigger( -> true)).to.be.true


  describe 'StringTransition', ->
    it 'should exist', (done) ->
      expect(StringTransition).to.be.a 'function'
      done()
    it 'should create an instance', (done) ->
      expect(new StringTransition).to.be.a 'object'
      done()
    it 'trigger successfully with correct input', (done) ->
      t1 = new StringTransition 'Hello'
      expect(t1.trigger 'Hello').to.be.true
      done()
    it 'dont trigger with wrong input', (done) ->
      t1 = new StringTransition 'Hello'
      expect(t1.trigger 'Foo').to.be.false
      done()
    it 'should fire a transition when trigegr is executed', (done) ->
      t1 = new StringTransition 'Foo'
      t1.on 'triggered', ->
        done()
      expect(t1.trigger('Foo')).to.be.true
    it.skip 'should fire a transition event when it is doing one', (done) ->
