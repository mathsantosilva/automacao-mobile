# Relatorios no formato Json
require "allure-cucumber"
# Subir uma instancia do appium e le os capabilities
require "appium_lib"
require "appium_lib_core"
# Limpar os logs e screenshots
require "fileutils"

AllureCucumber.configure do |config|
    config.results_directory = "report/allure-results"
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
    config.logger = Logger.new($stdout, Logger::DEBUG)
    config.environment = "staging"

    # these are used for creating links to bugs or test cases where {} is replaced with keys of relevant items
    config.link_tms_pattern = "http://www.jira.com/browse/{}"
    config.link_issue_pattern = "http://www.jira.com/browse/{}"
  
    # additional metadata
    # environment.properties
    config.environment_properties = {
      custom_attribute: "foo"
    }

end

AllureCucumber.configure do |config|
    config.tms_prefix      = 'HIPTEST--'
    config.issue_prefix    = 'JIRA++'
    config.severity_prefix = 'URGENCY:'
    config.epic_prefix = 'epic:'
    config.feature_prefix = 'feature:'
    config.story_prefix = 'story:'
end


# Carrega os Capabilities da pasta caps
caps = Appium.load_appium_txt file: File.expand_path("C:/Tools/caps/emulador_api_34.txt", __dir__)
# Levanta uma instancia do driver do appium passando o capabilities 
Appium::Driver.new(caps, true)

# Passando os metodos do appium para o cucumber
Appium.promote_appium_methods Object
