Dado('que realizo o login normal utilizando o login {string} e a senha {string} e clico no botão {string}') do |email, senha, botao|
    caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    find_element(xpath: "#{caminho_email}").send_keys(email)
    find_element(xpath: "#{caminho_senha}").send_keys(senha)
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    sleep 2
    @login.end_progress_bar
end

Dado('que realizo o login direto utilizando o login {string} e a senha {string} e clico no botão {string}') do |email, senha, botao|
    caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
    caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
    find_element(xpath: "#{caminho_email}").send_keys(email)
    find_element(xpath: "#{caminho_senha}").send_keys(senha)
    find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
    sleep 2
    @login.end_progress_bar
end

Quando('valido o nome do funcionario {string} e vou até a tela de marcação') do |nome_func|
    caminho_nome_func = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView'
    caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
    nome_atual = find_element(xpath: "#{caminho_nome_func.to_s}").text
    expect("#{nome_atual}").to eql nome_func
    find_element(xpath: "#{caminho_relogio}").click 
end

Quando('desativo a internet do celular e realizo a marcação de ponto offline') do
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    @marc.valida_hora_marc
    @net.set_modo_aviao
    sleep 2
    find_element(xpath: "#{caminho_marcar_ponto}").click
end

Quando('receber a mensagem {string} e o contador de marcações offline continue em {string}') do |message_sucess, quant_marcs_off|
    caminho_quant_marcs_off = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'
    caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
    message_atual = find_element(xpath: "#{caminho_message_sucess}").text
    quant_marcs_off_atual = find_element(xpath: "#{caminho_quant_marcs_off}").text
    expect(message_atual).to eql message_sucess
    expect(quant_marcs_off_atual).to eql quant_marcs_off
end

Quando('for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status {string}') do |status|
    caminho_tela_sinc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[3]/android.widget.ImageView'
    caminho_status_marc = '//android.widget.ListView/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView'
    find_element(xpath: "#{caminho_tela_sinc}").click
    @net.set_network_default
    puts 'ja foi'
    @sinc.status_conexao_sinc
    status_atual_marc = find_element(xpath: "#{caminho_status_marc}").text
    expect(status_atual_marc).to eql status
end

Quando('for clicado no botão sincronizar deve iniciar o progresso de upload') do
    caminho_botao_sinc = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView'
    find_element(xpath: "#{caminho_botao_sinc}").click
    sleep 1
    @sinc.end_progress_bar_sinc
end
  

Então('devo conseguir marcar o ponto online e receber a mensagem {string} e o contador de marcações offline continue em {string}') do |message_sucess, cont_marc|
    caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
    caminho_quant_marcs_off = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'
    caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
    @marc.valida_hora_marc
    find_element(xpath: "#{caminho_marcar_ponto}").click
        message_atual = find_element(xpath: "#{caminho_message_sucess}").text
    quant_marcs_off_atual = find_element(xpath: "#{caminho_quant_marcs_off}").text
    expect(message_atual).to eql message_sucess
    expect(quant_marcs_off_atual).to eql cont_marc
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
