Dado('realizo o login com o usuario {string} e utilizo o botão {string} BR') do |email, botao|
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar  
end

Quando('vou até a tela de marcação e marco ponto fora do raio BR') do
  caminho_relogio = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.ImageView'
  caminho_marcar_ponto = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.widget.ImageView'
  find_element(xpath: "#{caminho_relogio}").click 
  @loc.set_location(-23.961667, -46.332222)
  @marc.valida_hora_marc
  find_element(xpath: "#{caminho_marcar_ponto}").click 
end

Então('devo receber a mensagem de erro {string} e o contador de marcações offline continue em {string} BR') do |message_sucess, quant_marcs_off|
  caminho_quant_marcs_off = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[6]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView'
  caminho_message_sucess = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView'
  message_atual = find_element(xpath: "#{caminho_message_sucess}").text
  quant_marcs_off_atual = find_element(xpath: "#{caminho_quant_marcs_off}").text
  @loc.location_default
  expect(message_atual).to eql message_sucess
  expect(quant_marcs_off_atual).to eql quant_marcs_off   
end

Dado('que realizo o login com o usuario {string} e clico no botão {string} recebo a mensagem {string} BR') do |email, botao, mensagem|
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

Então('deve aparecer um popup informando {string} BR') do |mensagem|
  caminho_mensagem_chave = '//android.widget.TextView[@resource-id="android:id/message"]'
  mensagem_chave = find_element(xpath: "#{caminho_mensagem_chave}").text
  expect(mensagem_chave).to eql mensagem  
end