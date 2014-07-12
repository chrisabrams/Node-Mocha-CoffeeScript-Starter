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
    machine.run()


