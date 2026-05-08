Dado('que estou na tela de login multiusuário {string} e estou {string}') do |label, status|
    caminho_multiuser = "//android.view.View[@content-desc='#{label}']"
    caminho_status_rede = "//android.view.View[@content-desc='#{status}']"

    elemento_multiuser = find_element(xpath: caminho_multiuser)
    elemento_status_rede = find_element(xpath: caminho_status_rede)

    expect(elemento_multiuser.attribute('content-desc')).to eql(label)
    expect(elemento_status_rede.attribute('content-desc')).to eql(status)
end

Dado('seleciono a opção de login {string}') do |opcao|
    caminho_opcao_login = "//android.widget.RadioButton[@content-desc='#{opcao}']"
    find_element(xpath: "#{caminho_opcao_login}").click
end

Dado('que na tela e multiuser clico no botão {string}') do |botao|
    partes = botao
                .gsub("\\n", " ")
                .gsub("\n", " ")
                .squeeze(" ")
                .strip
                .split(" ")

    condicoes = partes.map { |parte| "contains(@content-desc, '#{parte}')" }.join(" and ")
    caminho_botao_azure = "//android.widget.ImageView[#{condicoes}]"
    @ges.scroll_ate_elemento(caminho_botao_azure)
    elemento_botao_azure = find_element(xpath: caminho_botao_azure)
    elemento_botao_azure.click
end

Dado('que desativo a internet do dispositivo para ficar {string}') do |status|
    @net.set_modo_aviao
    caminho_status_rede = "//android.view.View[@content-desc='#{status}']"
    elemento_status_rede = find_element(xpath: caminho_status_rede)
    expect(elemento_status_rede.attribute('content-desc')).to eql(status)
end

E('informo o identificador {string}') do |identificador|
    @helpers.esconder_teclado
    caminho_identificador = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]'
    caminho_scrollview_identificador = '//android.widget.ScrollView/android.view.View/android.widget.EditText[1]'
    result_scrollview = @helpers.scroll_view?(caminho_scrollview_identificador)
    
    if result_scrollview
        elemento_identificador = result_scrollview
    else
        elemento_identificador = find_element(xpath: "#{caminho_identificador}")
    end

    elemento_identificador.click
    elemento_identificador.clear
    elemento_identificador.send_keys(identificador)

end

E('informo a senha {string}') do |senha|
    caminho_senha = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]'
    caminho_scrollview_senha = '//android.widget.ScrollView/android.view.View/android.widget.EditText[2]'
    result_scrollview = @helpers.scroll_view?(caminho_scrollview_senha)

    if result_scrollview
        elemento_senha = result_scrollview
    else
        elemento_senha = find_element(xpath: "#{caminho_senha}")
    end

    elemento_senha.click
    elemento_senha.clear  
    elemento_senha.send_keys(senha)
    @helpers.esconder_teclado
end

Quando('clico no botão {string}') do |botao|
    find_element(xpath: "//android.widget.Button[@content-desc='#{botao}']").click
    @login.end_progress_bar
end

Quando('realizo login com as credenciais {string} e {string} no login do Azure AD') do |identificador, senha|
  @login.valid_microsoft_title
  @login.valid_microsoft_troca_conta
  find_element(class_name: "android.widget.EditText").send_keys(identificador)
  find_element(xpath: "//android.view.View/android.widget.Button[@resource-id='idSIButton9']").click
  sleep 2
  find_element(class_name: "android.widget.EditText").send_keys(senha)
  find_element(xpath: "//android.view.View/android.widget.Button[@resource-id='idSIButton9']").click
end

Então('devo acessar o aplicativo com sucesso e visualizar o nome do funcionario {string}') do |funcionario|
    caminho_nome_funcionario = "//android.view.View[@content-desc='#{funcionario}']"
    elemento_nome_funcionario = find_element(xpath: caminho_nome_funcionario)
    expect(elemento_nome_funcionario.attribute('content-desc')).to eql(funcionario)
end

E('realizo o logout pelo botão {string} para retornar a tela de login multiusuário') do |botao|
    caminho_definicoes = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[last()]'
    caminho_botao_sair = "//android.widget.Button[@content-desc='#{botao}']"
    caminho_botao_sim_sair = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]'
    find_element(xpath: caminho_definicoes).click
    @ges.scroll_ate_elemento(caminho_botao_sair)
    find_element(xpath: caminho_botao_sair).click
    find_element(xpath: caminho_botao_sim_sair).click
end