require 'settingslogic'
require 'request_store'
require 'dalli-elasticache'
require 'cap_client/engine'

module PubClient
  class AuthRequired < StandardError; end
  
end
