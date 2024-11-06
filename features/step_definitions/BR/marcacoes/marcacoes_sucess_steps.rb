Dado('realizo o login com o usuario {string} e clico no botão {string}') do |email, botao|     
    caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    find_element(xpath: "#{caminho_email}").send_keys(email)
    find_element(xpath: "#{caminho_senha}").send_keys('1')
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    @login.end_progress_bar                                          
  end                                                                                                                    
                                                                                                                         
  Quando('vou até a tela de marcação e realizo a marcação de ponto normalmente') do                                      
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    @dash.closed_save_password
    find_element(xpath: "#{caminho_relogio}").click 
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click                                        
  end                                                                                                                    
                                                                                                                         
  Então('devo receber a mensagem de sucesso {string} e o contador de marcações offline continue em {string}') do |message_sucess, quant_marcs_off|  
    caminho_quant_marcs_off = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'
    caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
    message_atual = find_element(xpath: "#{caminho_message_sucess}").text
    quant_marcs_off_atual = find_element(xpath: "#{caminho_quant_marcs_off}").text
    expect(message_atual).to eql message_sucess
    expect(quant_marcs_off_atual).to eql quant_marcs_off                                         
  end      
  
  Quando('a marcação e efetuada devo receber a mensagem {string} e o contador de marcações offline continue em {string}') do |message_sucess, quant_marcs_off|
    caminho_quant_marcs_off = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'
    caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
    message_atual = find_element(xpath: "#{caminho_message_sucess}").text
    quant_marcs_off_atual = find_element(xpath: "#{caminho_quant_marcs_off}").text
    expect(message_atual).to eql message_sucess
    expect(quant_marcs_off_atual).to eql quant_marcs_off  
  end

  Quando('for na tela de sincronização de marcações devo conseguir ver a marcação com status {string}') do |status|
    caminho_tela_sinc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[3]/android.widget.ImageView'
    caminho_status_marc = '//android.widget.ListView/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
    find_element(xpath: "#{caminho_tela_sinc}").click
    @sinc.status_conexao_sinc
    status_atual_marc = find_element(xpath: "#{caminho_status_marc}").text
    expect(status_atual_marc).to eql status
  end

  Quando('for clicado no botão sincronizar deve iniciar o progresso de upload') do
    caminho_botao_sinc = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView'
    find_element(xpath: "#{caminho_botao_sinc}").click
    @sinc.end_progress_bar_sinc
  end
  

  Então('deve aparecer um popup com a mensagem {string} após fechar o status da marcação deverá estar como {string}') do |message_sucess, status|
    caminho_mensagem_popup = '//android.widget.ScrollView[@resource-id="com.mobile.kairos:id/scrollView"]/android.widget.LinearLayout/android.widget.TextView'
    caminho_fechar_popup = '//android.widget.ScrollView[@resource-id="com.mobile.kairos:id/buttonPanel"]/android.widget.LinearLayout/android.widget.Button'
    caminho_status_marc = '//android.widget.ListView/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
    message_atual = find_element(xpath: "#{caminho_mensagem_popup}").text
    expect(message_atual).to eql message_sucess
    find_element(xpath: "#{caminho_fechar_popup}").click
    status_marc = find_element(xpath: "#{caminho_status_marc}").text
    expect(status_marc).to eql status
  end

  Quando('vou até a tela de marcação e realizo a marcação de ponto offline') do 
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    find_element(xpath: "#{caminho_relogio}").click 
    @marc.valida_hora_marc
    @net.set_modo_aviao
    find_element(xpath: "#{caminho_marcar_ponto}").click    
  end                                                                           
                                                                                
  Quando('for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status {string}') do |status|
    caminho_tela_sinc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[3]/android.widget.ImageView'
    caminho_status_marc = '//android.widget.ListView/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
    find_element(xpath: "#{caminho_tela_sinc}").click
    @net.set_network_default
    @sinc.status_conexao_sinc
    status_atual_marc = find_element(xpath: "#{caminho_status_marc}").text
    expect(status_atual_marc).to eql status
  end

  Quando('vou até a tela de marcação e realizo a marcação de ponto selecionando uma obra') do
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    caminho_box_obra = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
    caminho_item_obra = '//android.widget.ListView/android.widget.LinearLayout[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
    find_element(xpath: "#{caminho_relogio}").click 
    find_element(xpath: "#{caminho_box_obra}").click 
    find_element(xpath: "#{caminho_item_obra}").click 
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click   
  end

  Dado('que crio uma nova chave de emparelhamento e realizo o login com o usuario {string} e clico no botão {string}') do |email, botao|
    system("cd C:\\repositorios\\automacao_web\\Teste_automatizados && cucumber -t @prin_pess_mob_chave")
    caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    find_element(xpath: "#{caminho_email}").send_keys(email)
    find_element(xpath: "#{caminho_senha}").send_keys('1')
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    @login.end_progress_bar     
  end

  Dado('realizo o login com o usuario {string} clico no botão {string} e recebo a mensagem {string}') do |email, botao, mensagem|     
    caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    caminho_mensagem_chave = '//android.widget.TextView[@resource-id="android:id/message"]'
    find_element(xpath: "#{caminho_email}").send_keys(email)
    find_element(xpath: "#{caminho_senha}").send_keys('1')
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    @login.end_progress_bar
    mensagem_chave = find_element(xpath: "#{caminho_mensagem_chave}").text
    find_element(xpath: "//android.widget.Button[@resource-id='android:id/button2']").click
    expect(mensagem_chave).to eql mensagem                                           
  end                                                                                                                                   
                                                                                                                                        
  Quando('vou até a tela da chave de emparelhamento e clico no botão {string} para sincronizar a chave {string}') do |botao, mensagem|                                         
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_engrenagem = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.widget.ImageView'
    caminho_caixa_chave = '//android.widget.EditText'
    caminho_mensagem_ativa = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[5]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
    find_element(xpath: "#{caminho_relogio}").click 
    find_element(xpath: "#{caminho_engrenagem}").click 
    system("cd C:\\repositorios\\automacao_web\\Teste_automatizados && cucumber -t @prin_pess_mob_chave")
    chave = @arq.ler_ultima_linha_arquivo("C:/Tools/arquivos_testes/chaves.txt")
    find_element(xpath: "#{caminho_caixa_chave}").send_keys(chave)
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    mensagem_chave_ativa = find_element(xpath: "#{caminho_mensagem_ativa}").text
    expect(mensagem_chave_ativa).to include(mensagem)
  end                                                                                                                                   
                                                                                                                                        
  Quando('retorno a tela de marcação de ponto e realizo a marcação') do                                                                 
    caminho_botao_voltar = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'                                                         
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    find_element(xpath: "#{caminho_botao_voltar}").click  
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click  
  end                                                                                                                                   

  Quando('realizo a marcação de ponto e utilizo a autenticação para validar a marcação') do
    @dash.closed_save_password
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    find_element(xpath: "#{caminho_relogio}").click 
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click    
    @aut.use_finger_print(1)
  end

  Quando('ativo o modo multiuser recebo a mensagem {string} quantidade de usuario {string} e deslogo') do |msg_sucess, quant|
    caminho_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_config_multi = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[9]/android.view.ViewGroup/android.widget.TextView'
    caminho_flag_multi_ativo = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.CheckBox'
    caminho_empresa_1 = '//android.widget.ListView/android.widget.LinearLayout[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.CheckBox'
    caminho_empresa_2 = '//android.widget.ListView/android.widget.LinearLayout[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.CheckBox'
    caminho_empresa_3 = '//android.widget.ListView/android.widget.LinearLayout[4]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.CheckBox'
    caminho_empresa_4 = '//android.widget.ListView/android.widget.LinearLayout[5]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.CheckBox'
    caminho_botao_salvar = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
    caminho_msg_sucess = '//android.widget.ScrollView[@resource-id="com.mobile.kairos:id/scrollView"]/android.widget.LinearLayout/android.widget.TextView'
    caminho_botao_ok = '//android.widget.Button[@resource-id="android:id/button2"]'
    caminho_quant_usu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView'
    caminho_botao_voltar = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup[1]'
    caminho_botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
    mensagem_formatada = msg_sucess.gsub("\\n", "\n")
    @dash.end_load_widget
    find_element(xpath: "#{caminho_menu}").click
    find_element(xpath: "#{caminho_config_multi}").click
    @login.end_progress_bar
    find_element(xpath: "#{caminho_flag_multi_ativo}").click
    find_element(xpath: "#{caminho_empresa_1}").click
    find_element(xpath: "#{caminho_empresa_2}").click
    find_element(xpath: "#{caminho_empresa_3}").click
    find_element(xpath: "#{caminho_empresa_4}").click
    find_element(xpath: "#{caminho_botao_salvar}").click
    @login.end_progress_bar
    mensagem_sinc_sucess = find_element(xpath: "#{caminho_msg_sucess}").text
    expect(mensagem_sinc_sucess).to include(mensagem_formatada)
    find_element(xpath: "#{caminho_botao_ok}").click
    mensagem_quant_usu = find_element(xpath: "#{caminho_quant_usu}").text
    expect(mensagem_quant_usu).to include(quant)
    find_element(xpath: "#{caminho_botao_voltar}").click
    @ges.deslizar(200, 2100, 1000, 200, 1800)
    find_element(xpath: "#{caminho_botao_sair}").click
  end

  Quando('realizo o login no modo {string} com {string} e realizo a marcação de ponto') do |tipo, input|
    caminho_opc_matricula = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
    caminho_email = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    find_element(xpath: "//android.widget.TextView[@text='#{tipo}']").click
    find_element(xpath: "#{caminho_email}").send_keys(input)
    find_element(xpath: "#{caminho_senha}").send_keys(1)
    driver.hide_keyboard
    find_element(xpath: "//android.widget.TextView[@text='ENTRAR']").click
    @dash.valida_pop_sinc_marcs
    @dash.closed_save_password
    find_element(xpath: "#{caminho_relogio}").click
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click
    @marc.valida_camera_open
    @marc.valida_pop_multiuser
  end

  Quando('realizo a marcação de ponto e utilizo o reconhecimento facial') do
    @dash.closed_save_password
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    find_element(xpath: "#{caminho_relogio}").click 
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click    
  end

  Quando('acesso o reconhecimento facial e reconhece a face {string}') do |messsage_sucess|          
    caminho_botao_reconhecimento_facial = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[7]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
    caminho_mensagem_sucess_multiface = '//android.widget.TextView[@resource-id="com.mobile.kairos:id/snackbar_text"]'
    find_element(xpath: "#{caminho_botao_reconhecimento_facial}").click 
    @marc.valida_camera_open
    mensagem_sucess_multiface = find_element(xpath: "#{caminho_mensagem_sucess_multiface}").text
    expect(mensagem_sucess_multiface).to eql(messsage_sucess)
  end                                                                                       
                                                                                            
  Então('devo receber a mensagem de sucesso {string} no reconhecimento facial') do |messsage_sucess| 
    caminho_mensagem_sucess = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
    mensagem_sucess = find_element(xpath: "#{caminho_mensagem_sucess}").text
    expect(mensagem_sucess).to eql(messsage_sucess)         
  end                                                                                       