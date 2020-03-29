$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pub_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pub_client"
  s.version     = PubClient::VERSION
  s.authors     = ["William Ross"]
  s.email       = ["will@spanner.org"]
  s.homepage    = "https://github.com/croucherfoundation/pub_client"
  s.summary     = "Holds in one place all the gubbins necessary to act as a client to the Croucher publication system."
  s.description = "For now just a convenience and maintenance simplifier."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "her"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"

  s.add_development_dependency "sqlite3"
end
