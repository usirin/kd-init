fs = require 'fs'
path = require 'path'
inquirer = require 'inquirer'
repoName = require 'git-repo-name'

prompts = require './prompts'
providers = require './providers'


printWelcomeMessage = ->
  console.log prompts.WELCOME_MESSAGE
  Promise.resolve()

intro = ->
  inquirer.prompt prompts.intro repoName.sync()

instanceTypePrompt = (provider) ->
  inquirer.prompt prompts.instanceType provider

saveFilePrompt = (answers) ->
  template = providers[answers.provider].defaultTemplate(
    answers.instanceName
    answers.instanceType
  )

  console.log template.yaml

  inquirer.prompt(prompts.saveFile()).then (answers) ->
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
