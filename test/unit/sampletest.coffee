__base   = process.cwd()
chai     = require 'chai'
expect   = chai.expect

describe 'Smaple Test', ->

    it 'should be able to run a test', (done) ->

      done()

    it 'should be able to assert a value', (done) ->

      a = 1

      expect(a).to.equal 1

      done()

    it 'should be able to test an async operation', (done) ->

      # This funcion simply exectutes a callback
      myTestFunc = (callback) ->

        callback()

      # The function is run, and done() is performed inside the callback.
      myTestFunc () ->

        done()
