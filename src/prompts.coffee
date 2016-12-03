providers = require './providers'

providerNames = Object.keys(providers).reduce (result, key) ->
  name = providers[key].name
  result[name] = key
  return result
, {}

instanceTypes = Object.keys(providers).reduce (result, key) ->
  result[key] = providers[key].instanceTypes
  return result
, {}

exports.WELCOME_MESSAGE = """
  This utility will walk you through creating a kd.yml file.
  It tries to be as intelligent as possible, but modifications may be needed.

  Use `kd-init help` for more information.

  Press ^C at any time to quit.
"""

exports.intro = (defaultName) ->
  questions = [
    type: 'input'
    name: 'stackName'
    message: 'stack name'
    default: -> defaultName
  ,
    type: 'list'
    name: 'provider'
    message: 'Which provider do you want to use?'
    choices: Object.keys providerNames
    filter: (val) -> providerNames[val]
  ]

exports.instanceType = (provider) ->
  questions = [
    type: 'input'
    name: 'instanceName'
    message: 'stack name'
    default: -> "#{provider}-instance"
  ,
    type: 'list'
    name: 'instanceType'
    message: 'Choose instance type'
    default: -> providers[provider].instanceTypes['base-vm']
    choices: do ->
      Object.keys(providers[provider].instanceTypes).filter (type) ->
        type isnt 'base-vm'
  ]

exports.saveFile = ->
  questions = [
    type: 'input'
    name: 'configName'
    message: 'file name'
    default: -> 'kd.yml'
  ]

