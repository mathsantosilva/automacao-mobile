# api/endpoints/login_api.rb
require_relative '../client'
require_relative '../helpers/payloads'

class LoginAPI
  def self.criar_usuario(email:, senha:)
    payload = Payloads.usuario(email: email, senha: senha)
    ApiClient.post('/usuarios', body: payload)
  end

  def self.login(email:, senha:)
    payload = { email: email, senha: senha }
    ApiClient.post('/login', body: payload)
  end
end
