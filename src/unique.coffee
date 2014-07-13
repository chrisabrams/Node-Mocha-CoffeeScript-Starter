uuid = require 'node-uuid'

class Unique
  constructor: ->
    # foo
    @uuid = uuid.v4()
  getUuid: ->
    @uuid
module.exports = Unique
