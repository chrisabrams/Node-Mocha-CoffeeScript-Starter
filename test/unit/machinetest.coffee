__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect
{Machine} = require '../../src/machine'


describe 'Machine', ->
  it 'should exist', (done) ->
    expect(typeof Machine).to.equal 'function'
    done()
