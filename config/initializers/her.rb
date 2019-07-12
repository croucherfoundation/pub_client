require 'settings'
require 'her'
require 'faraday_middleware'

api_url = ENV['PUB_API_URL'] || "#{Settings.pub.protocol}://#{Settings.pub.api_host}:#{Settings.pub.api_port}"

PUB = Her::API.new
PUB.setup url: api_url do |c|
  # Request
  c.use FaradayMiddleware::EncodeJson
  # Response
  c.use Her::Middleware::JsonApiParser
  c.use Faraday::Adapter::NetHttp
end
