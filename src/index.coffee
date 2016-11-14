fs = require 'fs'
path = require 'path'
inquirer = require 'inquirer'
repoName = require 'git-repo-name'

providers = require './providers'

WELCOME_MESSAGE = """
  This utility will walk you through creating a kd.yml file.
  It tries to be as intelligent as possible, but modifications may be needed.

  Use `kd-init help` for more information.

  Press ^C at any time to quit.
"""

printWelcomeMessage = ->
  console.log WELCOME_MESSAGE
  Promise.resolve()

providerNames = Object.keys(providers).reduce (result, key) ->
  name = providers[key].name
  result[name] = key
  return result
, {}

instanceTypes = Object.keys(providers).reduce (result, key) ->
  result[key] = providers[key].instanceTypes
  return result
, {}

intro = ->
  questions = [
    type: 'input'
    name: 'stackName'
    message: 'stack name'
    default: -> repoName.sync()
  ,
    type: 'list'
    name: 'provider'
    message: 'Which provider do you want to use?'
    choices: Object.keys providerNames
    filter: (val) -> providerNames[val]
  ]

  inquirer.prompt(questions)

instanceTypePrompt = (provider) ->
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

  inquirer.prompt(questions)

saveFilePrompt = (answers) ->
  template = providers[answers.provider].defaultTemplate(
    answers.instanceName
    answers.instanceType
  )

  console.log template.yaml

  questions = [
    type: 'input'
    name: 'configName'
    message: 'file name'
    default: -> 'kd.yml'
  ]

  inquirer.prompt(questions).then (answers) ->
    Object.assign answers, { template }


finish = (config) ->
  fs.writeFile config.configName, config.template.yaml, (err) ->
    console.log "Your stack script is saved to #{path.join process.cwd(), config.configName}"


main = ->
  config = {}
  printWelcomeMessage()
    .then -> intro()
    .then (answers) ->
      config = Object.assign {}, config, answers
      instanceTypePrompt answers.provider
    .then (answers) ->
      config = Object.assign {}, config, answers
      saveFilePrompt config
    .then (answers) ->
      config = Object.assign {}, config, answers
      finish config

main()
