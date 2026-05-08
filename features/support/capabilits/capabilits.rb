require 'yaml'
require_relative '../config/constants'

class CapabilitiesBuilder
  APKS_FILE = 'features/support/data/apks.yaml'.freeze

  BASE_CAPS = {
    platformName: 'Android',
    'appium:automationName': 'UiAutomator2',

    'appium:adbExecTimeout': 500_000,
    'appium:uiautomator2ServerInstallTimeout': 500_000,
    'appium:uiautomator2ServerLaunchTimeout': 500_000,
    'appium:uiautomator2ServerReadTimeout': 500_000,
    'appium:androidInstallTimeout': 500_000,
    'appium:newCommandTimeout': 500_000,
    'appium:logcatFormat': 'process',
    'appium:noSign': true,
  }.freeze

  def self.build(profile: :app_installed, pais: nil, ambiente: nil, device: nil, overrides: {})
    config_atual = config_ambiente(pais, ambiente)
    device = device.strip if device

    device_caps = {
      'appium:udid': device
    }

    app_installed_caps = {
      'appium:appPackage': config_atual[:app_package],
      'appium:appActivity': config_atual[:app_activity],
      'appium:noReset': true,
      'appium:enforceAppInstall': false,
      'appium:dontStopAppOnReset': false
    }

    clean_app_caps = {
      'appium:appPackage': config_atual[:app_package],
      'appium:appActivity': config_atual[:app_activity],
      'appium:noReset': false,
      'appium:fullReset': false,
      'appium:enforceAppInstall': false,
      'appium:autoGrantPermissions': true
    }

    install_apk_caps = {
      'appium:app': config_atual[:caminho_apk],
      'appium:appPackage': config_atual[:app_package],
      'appium:appActivity': config_atual[:app_activity],
      'appium:noReset': false,
      'appium:fullReset': true,
      'appium:enforceAppInstall': true,
      'appium:autoGrantPermissions': true
    }


    profile_caps =
      case profile.to_sym
      when Constants::Tags::APP_INSTALLED
        app_installed_caps
      when Constants::Tags::CLEAN_APP
        clean_app_caps
      when Constants::Tags::INSTALL_APK
        install_apk_caps
      else
        raise "Profile de capabilities desconhecido: #{profile}"
      end

    BASE_CAPS
      .merge(device_caps)
      .merge(profile_caps)
      .merge(overrides)
  end

  def self.config_ambiente(pais, ambiente)
    apks = YAML.load_file(APKS_FILE)

    pais = pais.to_s.downcase.strip
    ambiente = ambiente.to_s.downcase.strip

    ambiente_chave =
      case ambiente
      when Constants::Ambientes::PRODUCAO
        Constants::Ambientes::PRODUCAO
      when Constants::Ambientes::QCMAINT
        Constants::Ambientes::QCMAINT
      when Constants::Ambientes::QCDEV
        Constants::Ambientes::QCDEV
      else
        raise "Ambiente inválido: #{ambiente}. Use: producao, qcmaint ou qcdev"
      end

    paises_validos = %w[br md pt mx]

    unless paises_validos.include?(pais)
      raise "País inválido: #{pais}. Use: #{paises_validos.join(', ')}"
    end

    chave = "apk_#{ambiente_chave}_#{pais}"

    apk_config = apks[chave]

    if apk_config.nil?
      raise "Configuração não encontrada no apks.yaml para a chave: #{chave}"
    end

    {
      caminho_apk: apk_config['caminho'],
      app_package: apk_config['apppackage'],
      app_activity: apk_config['appactivity'],
      chave: chave,
      pais: pais,
      ambiente: ambiente
    }
  rescue StandardError => error
    raise "Erro ao configurar ambiente: #{error.message}"
  end

  def self.app_package_from_capabilities(driver)
    caps = driver.capabilities

    caps[:appPackage] ||
      caps['appPackage'] ||
      caps[:'appium:appPackage'] ||
      caps['appium:appPackage']
  end
end