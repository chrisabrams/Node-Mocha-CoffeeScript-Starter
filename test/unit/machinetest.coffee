__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect
{Machine} = require '../../src/machine'

describe 'Machine', ->
  it 'should instantiate', ->
    machine = new Machine
    expect(machine).to.be.a.object
  it 'should run', ->
    machine = new Machine
    expect(machine.run()).to.be.true
  it 'should trigger an event when run', (done) ->
    machine = new Machine
    machine.on 'started', ->
      done()
    machine.run()
  it 'should send the states as event data', (done) ->
    machine = new Machine
    machine.on 'started', (evt) ->
      expect(evt.states).to.be.a.array
      done()
    machine.run()
  it 'should return its uuid', ->
    machine = new Machine
    expect(machine.getUuid().toString().length).to.be.equal 36
