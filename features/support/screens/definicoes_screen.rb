# support/screens/definicoes_screen.rb
require_relative 'login_screen'
require_relative '../gestures/gestures'

class DefinicoesScreen
  include RSpec::Matchers

  def initialize
    @login = LoginScreen.new
    @ges = Gestures.new
  end

  def ativar_multiusuario(identificador, senha, nome_funcionario, botao, mensagem_sucesso)
    @login.login_individual(identificador, senha, botao)
    caminho_nome_funcionario = "//android.view.View[@content-desc='#{nome_funcionario}']"
    caminho_definicoes = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[last()]'
    caminho_ativar_multiusuario = '//android.widget.Button[@content-desc="Configurar"]'
    caminho_switch_multiusuario = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.CheckBox[1]'
    caminho_selecionar_todas_opcoes = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.CheckBox[2]'
    caminho_botao_atualizar_usuarios = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]'
    caminho_mensagem_sucesso = "//android.view.View[@content-desc='#{mensagem_sucesso}']"
    caminho_botao_voltar = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]'
    caminho_botao_sair = "//android.widget.ScrollView/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[last()]"
    caminho_botao_sim_sair = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]'
    elemento_nome_funcionario = find_element(xpath: caminho_nome_funcionario)
    expect(elemento_nome_funcionario.attribute('content-desc')).to eql(nome_funcionario)
    find_element(xpath: caminho_definicoes).click
    @ges.scroll_ate_elemento(caminho_ativar_multiusuario)
    find_element(xpath: caminho_ativar_multiusuario).click
    find_element(xpath: caminho_switch_multiusuario).click
    find_element(xpath: caminho_selecionar_todas_opcoes).click
    find_element(xpath: caminho_botao_atualizar_usuarios).click
    validar_ativacao_multiusuario(caminho_mensagem_sucesso)
    $multiuser_ativo = true
    find_element(xpath: caminho_botao_voltar).click
    @ges.scroll_ate_elemento(caminho_botao_sair)
    find_element(xpath: caminho_botao_sair).click
    find_element(xpath: caminho_botao_sim_sair).click
  end

  def multiusuario_ativo?
    # valida se o switch/checkbox/label está ativo
  end

  private

  def acessar_definicoes
    # clique no menu / botão definições
  end

  def abrir_configuracao_multiusuario
    # navegação até a opção
  end

  def habilitar_multiusuario_se_necessario
    return if multiusuario_ativo?

    # clicar no switch
  end

  def salvar_definicoes
    # salvar/voltar, se necessário
  end

  def validar_ativacao_multiusuario(xpath_mensagem_sucesso)
    # validar mensagem de sucesso ou estado do switch 
    while true
      begin
        find_element(xpath: xpath_mensagem_sucesso)
        return true
      rescue
        next
      end
    end
  end
end