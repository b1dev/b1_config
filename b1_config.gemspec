$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "b1_config/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "b1_config"
  s.version     = B1Config::VERSION
  s.authors     = ["Chernov Alexandr"]
  s.email       = ["adok@ukr.net"]
  s.homepage    = "https://github.com/b1dev/b1_config"
  s.summary     = "Provides a Configuration helper  that reads from yaml files"
  s.description = "Easy to use Configuration helper that loads its data in from yaml files. Handles adding multiple sources, and easy reloading."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
end
