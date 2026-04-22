Dado('desativo a conexão e tento realizar o login com o usuario {string} e clico no botão {string}') do |email, botao|
  @net.set_modo_aviao
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys('1')
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar
end

Dado('realizo o login com o usuario {string} senha {string} com permissão offline e clico no botão {string}') do |email, senha, botao|
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar
end

Quando('deslogo, desativo a conexão e tento realizar o login com a senha {string} e o Botão {string}') do |senha, botao|
  @dash.closed_save_password
  botao_menu = '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ImageView'
  botao_sair = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
  find_element(xpath: "#{botao_menu}").click
  find_element(xpath: "#{botao_sair}").click
  @net.set_modo_aviao
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
end

Dado('realizo o login com o usuario desativado {string} senha {string} e clico no botão {string}') do |email, senha, botao|
  caminho_email = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.EditText'
  caminho_senha = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.EditText'
  find_element(xpath: "#{caminho_email}").send_keys(email)
  find_element(xpath: "#{caminho_senha}").send_keys(senha)
  find_element(xpath: "//android.widget.TextView[@text='#{botao}']").click
  @login.end_progress_bar
end

Então('deverá constar uma mensagem {string}') do |message|
  message_atual = find_element(id: 'android:id/message').text
  expect("#{message_atual}").to eql message
end