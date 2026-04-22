# api/helpers/payloads.rb
module Payloads
  def self.usuario(email:, senha:)
    {
      nome: 'Usuário Teste',
      email: email,
      senha: senha,
      administrador: 'true'
    }
  end
end
