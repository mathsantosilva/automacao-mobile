Dado('que estou na tela de login individual sem o campo {string} e estou {string}') do |label, status|
  caminho_multiuser = "//android.view.View[@content-desc='#{label}']"
  caminho_status_rede = "//android.view.View[@content-desc='#{status}']"

  elementos_multiuser = find_elements(xpath: caminho_multiuser)
  elemento_status_rede = find_element(xpath: caminho_status_rede)

  expect(elementos_multiuser).to be_empty
  expect(elemento_status_rede.attribute('content-desc')).to eql(status)
end

Então('devo acessar o aplicativo com sucesso e visualizar o nome do {string} e clica em {string} para retornar a tela de login') do |funcionario, botao|
  caminho_nome_funcionario = "//android.view.View[@content-desc='#{funcionario}']"
  elemento_nome_funcionario = find_element(xpath: caminho_nome_funcionario)
  expect(elemento_nome_funcionario.attribute('content-desc')).to eql(funcionario)
  caminho_botao_fechar = "//android.widget.Button[@content-desc='#{botao}']"
  elemento_botao_fechar = find_element(xpath: caminho_botao_fechar)
  elemento_botao_fechar.click
end