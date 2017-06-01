$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exchange_rate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exchange_rate"
  s.version     = ExchangeRate::VERSION
  s.authors     = ["rodrigopk"]
  s.email       = ["rodrigopk"]
  # s.homepage    = "TODO"
  s.summary     = "Provides exchange rates between currencies"
  s.description = "Provides an exchange rate between two currencies given a certain date."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.3"

  s.add_development_dependency "sqlite3"
end
