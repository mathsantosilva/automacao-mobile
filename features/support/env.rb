# Relatorios no formato Json
require "allure-cucumber"
# Subir uma instancia do appium e le os capabilities
require "appium_lib"
require "appium_lib_core"
# Limpar os logs e screenshots
require "fileutils"
require 'JSON'
require 'date'

AllureCucumber.configure do |config|
    config.results_directory = "report/allure-results"
    config.clean_results_directory = true
    config.logger = Logger.new($stdout, Logger::INFO)
    config.logging_level = Logger::INFO
    config.environment = "staging"

    # these are used for creating links to bugs or test cases where {} is replaced with keys of relevant items
    config.link_tms_pattern = "http://www.jira.com/browse/{}"
    config.link_issue_pattern = "http://www.jira.com/browse/{}"
  
    # additional metadata
    # environment.properties
    config.environment_properties = {
      custom_attribute: "foo",
      os_platform: RbConfig::CONFIG['host_os'],
      ruby_version: RUBY_VERSION
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
caps = Appium.load_appium_txt file: File.expand_path("C:/Tools/caps/Emulador_api_30.txt", __dir__)
# Levanta uma instancia do driver do appium passando o capabilities 
Appium::Driver.new(caps, true)

# Passando os metodos do appium para o cucumber
Appium.promote_appium_methods Object
