require 'settings'
require 'paginated_her'

Settings.pub ||= {}
Settings.pub[:protocol] ||= 'http'
Settings.pub[:api_host] ||= Settings.pub[:host] || 'localhost'
Settings.pub[:api_port] ||= Settings.pub[:port] || 8007

PUB = Her::API.new
PUB.setup url: "#{Settings.pub.protocol}://#{Settings.pub.api_host}:#{Settings.pub.api_port}" do |c|
  c.use Faraday::Request::UrlEncoded
  c.use PaginatedHer::Middleware::Parser
  c.use Faraday::Adapter::NetHttp
end
