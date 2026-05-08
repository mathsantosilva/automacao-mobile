require "allure-cucumber"
require "appium_lib"
require "appium_lib_core"
require "fileutils"
require 'dotenv'

# Carrega os dados do .env
Dotenv.load

custom_profile_arg = ARGV.find { |arg| arg.start_with?('--test-profile=') }

if custom_profile_arg
  TEST_PROFILE = custom_profile_arg.split('=', 2).last
  ARGV.delete(custom_profile_arg)
else
  TEST_PROFILE = 'padrao'
end

AllureCucumber.configure do |config|
  config.results_directory = "report/allure-results"
  config.clean_results_directory = true

  logger = Logger.new($stdout)
  logger.level = Logger::WARN

  config.logger = logger
  config.logging_level = Logger::WARN
  config.environment = "staging"

  config.link_tms_pattern = "http://www.jira.com/browse/{}"
  config.link_issue_pattern = "http://www.jira.com/browse/{}"

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


