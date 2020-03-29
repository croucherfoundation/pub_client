require 'settings'
require 'faraday_middleware'
require 'her'
require 'her/middleware/json_api_parser'

api_url = ENV['PUB_API_URL'] || "#{Settings.pub.protocol}://#{Settings.pub.api_host}:#{Settings.pub.api_port}"

PUB_API = Her::API.new
PUB_API.setup url: api_url do |c|
  # Request
  c.use FaradayMiddleware::EncodeJson
  # Response
  c.use Her::Middleware::JsonApiParser
  c.use Faraday::Adapter::NetHttp
end
