Unique = require '../../src/unique'

__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

describe 'Unique', ->
  it 'should exist', (done) ->
    expect(Unique).to.be.a 'function'
    done()
  it 'should instantiate', (done) ->
    expect(new Unique).to.be.a 'object'
    done()
  it 'should have get me a uuid', () ->
    unique = new Unique
    expect(unique.getUuid().length).to.be.equal 36
