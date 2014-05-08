require 'settings'
require 'paginated_her'
require 'dalli-elasticache'
require 'faraday_middleware/response/caching'

Settings.pub ||= {}
Settings.pub[:protocol] ||= 'http'
Settings.pub[:api_host] ||= Settings.pub[:host] || 'localhost'
Settings.pub[:api_port] ||= Settings.pub[:port] || 8007

Settings[:memcached] ||= {}
Settings.memcached[:endpoint] ||= nil
Settings.memcached[:host] ||= nil
Settings.memcached[:port] ||= 11211
Settings.memcached[:ttl] ||= 10.minutes

if Settings.memcached.endpoint
  elasticache_endpoint = Dalli::ElastiCache.new("#{Settings.memcached.endpoint}:#{Settings.memcached.port}", expires_in: Settings.memcached.ttl)
  $cache ||= elasticache_endpoint.client

elsif Settings.memcached.host
  $cache ||= Dalli::Client.new("#{Settings.memcached.host}:#{Settings.memcached.port}", expires_in: Settings.memcached.ttl)
end

PUB = Her::API.new
PUB.setup url: "#{Settings.pub.protocol}://#{Settings.pub.api_host}:#{Settings.pub.api_port}" do |c|
  c.use FaradayMiddleware::Caching, $cache.clone if $cache
  c.use Faraday::Request::UrlEncoded
  c.use PaginatedHer::Middleware::Parser
  c.use Faraday::Adapter::NetHttp
end
