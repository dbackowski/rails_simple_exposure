$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_simple_exposure/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_simple_exposure"
  s.version     = RailsSimpleExposure::VERSION
  s.authors     = ["Damian Baćkowski"]
  s.email       = ["damianbackowski@gmail.com"]
  s.homepage    = "https://github.com/dbackowski/rails_simple_exposure"
  s.summary     = "Cleanup your Rails controllers."
  s.description = "Cleanup your Rails controllers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0", "< 6.0"
end
