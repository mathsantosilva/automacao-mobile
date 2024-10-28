Dado('realizo o login com o usuario {string} com permissão offline e clico no botão {string}') do |email, botao|
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar
end

Quando('deslogo e desativo a internet do dispositivo') do
  @dash.closed_save_password
  botao_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "#{botao_menu}").click
  find_element(xpath: "#{botao_sair}").click
  @net.set_modo_aviao
end

Quando('encerro o app e abro novamente') do
  driver.terminate_app('com.mobile.kairos')
  driver.activate_app('com.mobile.kairos')
  @login.find_logotipo
end

Dado('realizo o login com o usuario {string} senha {string}, clico em {string} e em {string}') do |email, senha, lembrar, botao|  
  @login.permissao_bluetooth
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  caminho_text_lembrar = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[6]/android.view.ViewGroup[1]/android.widget.TextView'
  caminho_checkbox_lembrar = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.widget.CheckBox'
  text_lembrar = find_element(xpath: "#{caminho_text_lembrar}").text
  expect("#{text_lembrar}").to eql lembrar
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "#{caminho_checkbox_lembrar}").click
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar                                                        
end 

Quando('deslogo e tento logar com a senha salva clicando em {string}') do |botao|  
  @dash.closed_save_password                                                   
  botao_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "#{botao_menu}").click
  find_element(xpath: "#{botao_sair}").click
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
end 

Quando('deslogo, finalizo o app e inicio novamente') do
  @dash.closed_save_password
  botao_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "#{botao_menu}").click
  find_element(xpath: "#{botao_sair}").click
  driver.terminate_app('com.mobile.kairos')
  driver.activate_app('com.mobile.kairos')
end

Então('devo conseguir logar normalmente com o botão {string} e visualizar o nome do funcionario {string}') do |botao, nome_func|
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  nome_atual = find_element(xpath: "#{caminho_nome_func}").text
  expect("#{nome_atual}").to eql nome_func
end

Quando('tento logar com a senha salva clicando em {string}') do |botao|
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
end

Então('devo conseguir visualizar o nome do funcionario {string}') do |nome_func|                                                          
  caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
  nome_atual = find_element(xpath: "#{caminho_nome_func}").text
  expect("#{nome_atual}").to eql nome_func
end   

Dado('que clico em {string} e insiro o email {string} e clico em {string}') do |bt_esqueci, email, bt_recuperar|
  caminho_campo_email = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "//android.widget.TextView[@text='#{bt_esqueci}']").click
  find_element(xpath: "#{caminho_campo_email}").send_keys(email)
  find_element(xpath: "//android.widget.TextView[@text='#{bt_recuperar}']").click
  @login.end_progress_bar                                                        
end

Então('Devera constar a mensagem de recuperação {string}') do |message|
  caminho_mensagem = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  msg = find_element(xpath: "#{caminho_mensagem}").text
  expect("#{msg}").to eql message
end

Dado('que clico no botão {string}') do |bt_azure|
  find_element(xpath: "//android.widget.TextView[@text='#{bt_azure}']").click
end

Quando('preencho o email {string} e senha {string} e clico em entrar na microsoft enterprise do ambiente BR') do |email, senha|
  @login.valid_microsoft_title
  @login.valid_microsoft_troca_conta
  find_element(class_name: "android.widget.EditText").send_keys(email)
  find_element(xpath: "//android.view.View/android.widget.Button[@resource-id='idSIButton9']").click
  sleep 2
  find_element(class_name: "android.widget.EditText").send_keys(senha)
  find_element(xpath: "//android.view.View/android.widget.Button[@resource-id='idSIButton9']").click
end

Quando('deslogo e insiro a senha novamente e clico em {string}') do |bt_recuperar|
  @dash.closed_save_password
  botao_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{botao_menu}").click
  find_element(xpath: "#{botao_sair}").click
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{bt_recuperar}']").click
  @login.end_progress_bar 
end

Então('deverá direcionar para a dashboard e apresentar o nome do funcionario azure {string}') do |nome|
  @login.end_progress_bar
  caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
  nome_atual = find_element(xpath: "#{caminho_nome_func.to_s}").text
  expect("#{nome_atual}").to eql nome
end

Dado('realizo o login com o usuario {string} senha {string} e clico no botão {string}') do |email, senha, botao|
  @login.permissao_bluetooth
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar 
end

Então('devo conseguir visualizar a tela {string} e nome do funcionario {string}') do |titulo, nome|
  @login.end_progress_bar
  titulo_tela = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView'
  caminho_nome_func = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[8]/android.view.ViewGroup[1]/android.widget.TextView'
  titulo_atual = find_element(xpath: "#{titulo_tela}").text
  nome_atual = find_element(xpath: "#{caminho_nome_func}").text
  expect("#{titulo_atual}").to eql titulo                           
  expect("#{nome_atual}").to eql nome                           
end                                                                                                       