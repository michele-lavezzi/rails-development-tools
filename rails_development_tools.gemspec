$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_development_tools/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_development_tools"
  s.version     = RailsDevelopmentTools::VERSION
  s.authors     = ["michele-lavezzi"]
  s.email       = ["michele.lavezzi@gmail.com"]
  #s.homepage    = "local"
  s.summary     = "Tools to speed up Rails applications development"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency 'deface'
end
