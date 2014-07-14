__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

{State, FinalState, InitialState} = require '../../src/state'
{StringTransition, Transition} = require '../../src/transition'
{Machine} = require '../../src/machine'

describe 'putting it all together', ->
  it 'should execute the hello world case',(done) ->
    # two states, we need to go from "hello" to "world"
    s1 = new State
    s2 = new State
    # and a final state when "world" is reached
    doneState = new FinalState
    t1 = new StringTransition 'Hello'
    t2 = new StringTransition 'world'
    machine = new Machine
    machine.addState s1
    machine.addState s2
    machine.addState doneState
    machine.setInitialState s1
    done()
