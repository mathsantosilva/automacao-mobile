require 'yaml'
require_relative 'gestures/gestures'
require_relative 'config/constants'

BeforeAll do
  $inicio_execucao = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  $multiuser_ativo = false
  puts "Informe o id do dispositivo para execução (ex: emulator-5554 ou 1234567890abcdef):"
  $device = STDIN.gets.chomp
  puts "Informe o ambiente para execução (producao, qcmaint ou qcdev):"
  $ambiente = STDIN.gets.chomp
  $args_recebidos = ARGV
  tag_recebida = $args_recebidos[1]
  $pais = tag_recebida.gsub('@', '').split('_').first

end

Before do |scenario|

  @login = LoginScreen.new
  @dash = DashboardScreen.new
  @net = ManipuleNetwork.new
  @sinc = SincScreen.new
  @marc = MarcScreen.new
  @maniscreen = ManipuleScreen.new
  @loc = Location.new
  @arq = Arquivos.new
  @aut = Autentication.new
  @ges = Gestures.new
  @helpers = Helpers.new
  @def = DefinicoesScreen.new
  @cap = CapabilitiesBuilder.new
  @users = nil

  profile =
    if scenario.source_tag_names.include?('@clean_app')
      :clean_app
    elsif scenario.source_tag_names.include?('@install_apk')
      :install_apk
    else
      :app_installed
    end

  caps = {
    caps: CapabilitiesBuilder.build(profile: profile, pais: $pais, ambiente: $ambiente, device: $device),
    appium_lib: {
      server_url: ENV.fetch('APPIUM_SERVER_URL', 'http://127.0.0.1:4723'),
      direct_connect: false
    }
  }

  Appium::Driver.new(caps, true)
  Appium.promote_appium_methods Object

  driver.start_driver
  driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT

  app_package = @helpers.app_package_from_caps

  if driver.app_state(app_package) != :running_in_foreground
    driver.activate_app(app_package)
  end

  @net.set_network_default
  @maniscreen.validscreenlock
  @helpers.conceder_permissoes

  if profile == :clean_app and $multiuser_ativo
    $multiuser_ativo = false
  end

  if scenario.source_tag_names.any? { |tag| tag.downcase.include?('multiuser') } and not $multiuser_ativo
    begin
      if not @users
        @users = YAML.load_file('features/support/data/users.yaml')
        case $pais
          when 'br'
            email_store = @users['store_br']['email']
            senha_store = @users['store_br']['senha']
            nome_funcionario = @users['store_br']['nome_funcionario']
            botao = @users['store_br']['botao']
            mensagem_sucesso = @users['store_br']['mensagem_sucesso']
          when 'md'
            email_store = @users['store_md']['email']
            senha_store = @users['store_md']['senha']
            nome_funcionario = @users['store_md']['nome_funcionario']
            botao = @users['store_md']['botao']
            mensagem_sucesso = @users['store_md']['mensagem_sucesso']
          when 'mx'
            email_store = @users['store_mx']['email']
            senha_store = @users['store_mx']['senha']
            nome_funcionario = @users['store_mx']['nome_funcionario']
            botao = @users['store_mx']['botao']
            mensagem_sucesso = @users['store_mx']['mensagem_sucesso']
          when 'pt'
            email_store = @users['store_pt']['email']
            senha_store = @users['store_pt']['senha']
            nome_funcionario = @users['store_pt']['nome_funcionario']
            botao = @users['store_pt']['botao']
            mensagem_sucesso = @users['store_pt']['mensagem_sucesso']
          else
            raise "País inválido: #{ $pais }. Use: br, md, mx ou pt"
          end
      end
    rescue StandardError => error
      raise "Falha ao carregar usuários do YAML: #{error.message}"
    end

    if profile != :clean_app
      @helpers.limpar_dados_app(app_package)
      @helpers.conceder_permissoes
    end

    @def.ativar_multiusuario(email_store, senha_store, nome_funcionario, botao, mensagem_sucesso)
  end
end

After do |scenario|
  begin
    if scenario.failed?
      @helpers.anexar_diagnostico_falha_allure(scenario)
      @helpers.anexar_screenshot_allure(scenario)
      driver.terminate_app(@helpers.app_package_from_caps)
    end
  rescue StandardError => error
    puts "!Exception no After hook: #{error}"
  end
end

AfterAll do
  current_driver = nil

  begin
    current_driver = driver
  rescue NameError
    puts "Driver não existe no contexto do AfterAll."
  rescue StandardError => error
    puts "Não foi possível obter o driver no AfterAll: #{error}"
  end

  if current_driver
    begin
      app_package = CapabilitiesBuilder.app_package_from_capabilities(current_driver)

      if app_package
        current_driver.terminate_app(app_package)
      else
        puts "appPackage não encontrado nas capabilities."
      end

    rescue StandardError => error
      puts "!Exception ao finalizar app no AfterAll: #{error}"
    ensure
      begin
        current_driver.quit
      rescue StandardError => error
        puts "!Exception ao finalizar driver no AfterAll: #{error}"
      end
    end
  end
  fim = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  duracao = fim - $inicio_execucao
  puts "Duração: #{duracao.round(2)} segundos"
end