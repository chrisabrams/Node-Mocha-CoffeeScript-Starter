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

  describe 'StringTransition', ->
    it 'should exist', (done) ->
      expect(StringTransition).to.be.a 'function'
      done()
    it 'should create an instance', (done) ->
      expect(new StringTransition).to.be.a 'object'
      done()
