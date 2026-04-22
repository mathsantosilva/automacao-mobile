# api/client.rb
require 'httparty'

class ApiClient
  include HTTParty
  base_uri ENV['BASE_API_URL'] || 'https://suaapi.exemplo.com'

  def self.get(path, headers: {}, query: {})
    response = get(path, headers: headers, query: query)
    handle_response(response)
  end

  def self.post(path, body:, headers: {})
    response = post(path, body: body.to_json, headers: headers.merge({ 'Content-Type' => 'application/json' }))
    handle_response(response)
  end

  def self.handle_response(response)
    if response.success?
      response.parsed_response
    else
      raise "Erro na API (#{response.code}): #{response.body}"
    end
  end
end
