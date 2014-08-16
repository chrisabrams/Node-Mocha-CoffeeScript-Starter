__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect
{Machine} = require '../../src/machine'
{InitialState, State} = require '../../src/state'

describe 'Machine', ->
  beforeEach  ->
    @machine = new Machine
    @machine.setInitialState(new InitialState)
  it 'should instantiate', ->
    expect(@machine).to.be.a.object
  it 'should run', ->
    expect(@machine.run()).to.be.true
  it 'should trigger an event when run', (done) ->
    @machine.on 'started', ->
      done()
    @machine.run()
  it 'should send the states as event data', (done) ->
    @machine.on 'started', (evt) ->
      expect(evt.states).to.be.a.array
      done()
    @machine.run()
  it 'should return its uuid', ->
    expect(@machine.getUuid().toString().length).to.be.equal 36
  it 'should throw when run() is called and no  state is set', () ->
    machine = new Machine
    expect(-> machine.run()).to.throw 'E_INITIAL_STATE'
