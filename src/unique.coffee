uuid = require 'node-uuid'
{EventEmitter} = require 'events'
###*
 * A Unique base class, that creates a uuid for a object on creation
 *
###
class Unique extends EventEmitter
  constructor: ->
    # foo
    @uuid = uuid.v4()
  getUuid: ->
    @uuid
module.exports = Unique
