Então('devo visualizar a mensagem de erro {string}') do |msg|
  caminho_elemento_msg = "//android.view.View[@content-desc='#{msg}']"
  elemento_msg = find_element(xpath: caminho_elemento_msg)
  expect(elemento_msg.attribute('content-desc')).to eq(msg)
end

Então('devo permanecer na tela de login multiusuário') do
    @ges.scroll_simples_para_cima
    caminho_multiuser = "//android.view.View[@content-desc='Login usando:']"
    elemento_multiuser = find_element(xpath: caminho_multiuser)
    expect(elemento_multiuser.attribute('content-desc')).to eql("Login usando:")
end