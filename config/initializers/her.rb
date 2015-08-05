require 'settings'
require 'her'
require 'faraday_middleware'

Settings.pub ||= {}
Settings.pub[:protocol] ||= 'http'
Settings.pub[:api_host] ||= Settings.pub[:host] || 'localhost'
Settings.pub[:api_port] ||= Settings.pub[:port] || 8007

PUB = Her::API.new
PUB.setup url: "#{Settings.pub.protocol}://#{Settings.pub.api_host}:#{Settings.pub.api_port}" do |c|
  # Request
  c.use FaradayMiddleware::EncodeJson
  # Response
  c.use Her::Middleware::JsonApiParser
  c.use Faraday::Adapter::NetHttp
end
