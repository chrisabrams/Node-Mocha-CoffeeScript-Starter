__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

{State, FinalState, InitialState} = require '../../src/state'
{StringTransition, Transition} = require '../../src/transition'
{Machine} = require '../../src/machine'


describe 'putting it all together', ->
  it 'should execute the hello world case', ->
    # two states
    s1 = new State
    s2 = new State
    # and then a final one to quit
    done = new FinalState
    # We want to print hello world, so we start with hello
    t1 = new StringTransition 'Hello'
    expect(t1.setTargetState s2).to.be.true
    expect(s1.addTransition t1).to.be.true
    # and then world
    t2 = new StringTransition 'world'
    expect(t2.setTargetState done).to.be.true
    expect(s2.addTransition t2).to.be.true
    # et voila 'Hello -> world -> done()'
    machine = new Machine
    machine.addState s1
    machine.addState s2
    machine.addState done
    machine.setInitialState s1
