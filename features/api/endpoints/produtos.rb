# api/endpoints/produto_api.rb
require_relative '../client'

class ProdutoAPI
  def self.buscar_produtos
    ApiClient.get('/produtos')
  end
end
