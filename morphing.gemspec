$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "morphing/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "morphing"
  s.version     = Morphing::VERSION
  s.authors     = ["Dave Paola"]
  s.email       = ["dpaola2@gmail.com"]
  s.homepage    = "https://www.bloc.io"
  s.summary     = "Become your users."
  s.description = "Become your users."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.6"
  s.add_dependency "devise", "~> 3.4.0"
end
