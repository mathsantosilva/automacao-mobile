Dado('que preencho o email {string} e  a senha {string} e clico no botão principal {string} no aplicativo BR') do |email, senha, botao|
  @login.permissao_bluetooth
  hora_primeira_mark = ''
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  sleep 2
  @login.end_progress_bar
end

Quando('for direcionado para a dashboard e apresentar o nome do funcionario {string} do ambiente BR e clicar no relogio') do |nome|
  caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
  caminho_botao = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
  @dash.closed_save_password
  nome_atual = find_element(xpath: "#{caminho_nome_func.to_s}").text
  expect("#{nome_atual}").to eql nome
  find_element(xpath: "#{caminho_botao}").click 
end

Quando('clicar em marcar ponto no aplicativo BR') do
  @login.permissao_gps
  @marc.valida_hora_marc
  caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
  find_element(xpath: "#{caminho_marcar_ponto}").click
  @login.permissao_pasta  
end

Então('deverá apresentar a mensagem {string} em portugues-br') do |message_sucess|
  sleep 2
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  message_atual = find_element(xpath: "#{caminho_message_sucess}").text
  expect(message_atual).to eql message_sucess
end

Quando('estiver no dashboard em portugues-br clico no menu e e deslogo do app') do
  caminho_menu = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_sair = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  @dash.closed_save_password
  find_element(xpath: "#{caminho_menu}").click
  find_element(xpath: "#{caminho_sair}").click
end

Quando('clico no botão em portugues-br {string}') do |botao|
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  sleep 2
end

Quando('clicar em marcar ponto no aplicativo BR deverá receber a mensagem {string} e ficar com a quantidade de {string} marcações por enviar') do |message_sucess, quantidade|  
  caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  caminho_quant_marc = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'     
  @login.permissao_gps
  find_element(xpath: "#{caminho_marcar_ponto}").click
  @login.permissao_pasta  
  sleep 2
  message_atual = find_element(xpath: "#{caminho_message_sucess}").text
  expect(message_atual).to eql message_sucess
  quant_atual = find_element(xpath: "#{caminho_quant_marc}").text
  expect(quant_atual).to eql quantidade
                                                                                 
end                                                                                                                                                                  
                                                                                                                                                                     
Então('deverá contem uma marcação {string}, clicando em sincronizar deverá informar {string} e o status de {string} no envio para o sistema BR') do |status, message_sucess, status_sinc|                  
  caminho_marc_sinc = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[3]/android.widget.ImageView'
  caminho_status_marc = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ListView/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
  caminho_botao_sinc = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView'
  find_element(xpath: "#{caminho_marc_sinc}").click   
  status_atual = find_element(xpath: "#{caminho_status_marc}").text
  expect(status_atual).to eql status
  find_element(xpath: "#{caminho_botao_sinc}").click
  message_sinc_atual = find_element(id: "android:id/message").text
  expect(message_sinc_atual).to eql message_sucess
  find_element(id: "android:id/button2").click
  status_atual_sinc = find_element(xpath: "#{caminho_status_marc}").text
  expect(status_atual_sinc).to eql status_sinc                                                                                        
end                                                                                                                                                                  
                                                                                                                                                                     

Dado('realizo o login com o email {string} e  a senha {string} master e clico em {string} no aplicativo BR') do |email, senha, botao|
  @login.permissao_bluetooth
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  sleep 2
  @login.end_progress_bar
end

Quando('estiver no dashboard clico no menu e vou na opção em portugues-br {string}') do |opcao|
  sleep 2
  caminho_menu = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  find_element(xpath: "#{caminho_menu}").click
  find_element(xpath: "//android.widget.TextView[@text='#{opcao}']").click

end

Quando('habilito a opção {string} e seleciono a empresa e filial do ambiente BR') do |opcao, table|
  find_element(xpath: "//android.widget.CheckBox[@text='#{opcao}']").click
  empresas = table.rows_hash
  empresas.each do |emp|
    find_element(xpath: "//android.widget.CheckBox[@text='#{emp[1]}']").click
  end

end

Quando('clico em {string}, fecho a mensagem de sucesso {string} em portugues-br e deslogo') do |botao, message_sucess|
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.TextView'
  caminho_botao_voltar = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_opcao_sair = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  message_atual = find_element(xpath: "#{caminho_message_sucess}").text
  message_atual.sub!("\n", " ")
  expect(message_atual).to eql message_sucess
  find_element(id: "android:id/button2").click
  find_element(xpath: "#{caminho_botao_voltar}").click
  find_element(xpath: "#{caminho_opcao_sair}").click
end

Então('devo conseguir realizar login no ambiente BR com as opções Email, Matricula, CPF e PIS, utilizando a senha {string}, clicar em {string} e receber a mensagem de sucesso ao marcar ponto {string}') do |senha, botao, message_sucess, table|
  caminho_campo_matricula = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_campo_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  caminho_botao_voltar = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]'
  caminho_menu = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_opcao_sair = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  opcoes = table.rows_hash
  opcoes.each do |opc|
    find_element(xpath: "//android.widget.TextView[@text='#{opc[0]}']").click
    find_element(xpath: "#{caminho_campo_matricula}").send_keys(opc[1])
    find_element(xpath: "#{caminho_campo_senha}").send_keys(senha)
    hide_keyboard
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    find_element(xpath: "#{caminho_relogio}").click
    @login.permissao_gps
    find_element(xpath: "#{caminho_marcar_ponto}").click
    @login.permissao_pasta
    sleep 2
    @login.popup_marc_manter_logado
    message_atual = find_element(xpath: "#{caminho_message_sucess}").text
    expect(message_atual).to eql message_sucess
    find_element(xpath: "#{caminho_botao_voltar}").click
    find_element(xpath: "#{caminho_menu}").click
    find_element(xpath: "#{caminho_opcao_sair}").click
  end
end

Dado('que clico no botão Entrar com azure AD no aplicativo BR') do
  @login.permissao_bluetooth
  caminho_botao_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "#{caminho_botao_azure}").click 
end

Quando('preencho o email {string} e senha {string} e clico em entrar na microsoft enterprise do ambiente BR') do |email, senha|
  caminho_campo_email_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText'
  caminho_botao_avancar_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]/android.view.View/android.view.View[4]/android.widget.Button[2]'
  caminho_campo_senha_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText'
  caminho_botao_entrar_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[4]/android.widget.Button'
  @login.valid_microsoft_title
  @login.valid_microsoft_troca_conta
  find_element(class_name: "android.widget.EditText").send_keys(email)
  find_element(xpath: "//android.widget.Button[@text='Avançar']").click
  find_element(class_name: "android.widget.EditText").send_keys(senha)
  find_element(xpath: "//android.widget.Button[@text='Entrar']").click
end

Então('deverá direcionar para a dashboard e apresentar o nome do funcionario azure {string} e marcar ponto demonstrando a mensagem {string} em portugues-br') do |nome, message_sucess|
  caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
  caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  nome_atual = find_element(xpath: "#{caminho_nome_func.to_s}").text
  expect("#{nome_atual}").to eql nome
  find_element(xpath: "#{caminho_relogio}").click
  @login.permissao_gps
  find_element(xpath: "#{caminho_marcar_ponto}").click
  @login.permissao_pasta
  sleep 2
  message_atual = find_element(xpath: "#{caminho_message_sucess}").text
  expect(message_atual).to eql message_sucess  
end