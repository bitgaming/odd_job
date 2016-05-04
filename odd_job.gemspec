$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "odd_job/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "odd_job"
  s.version     = OddJob::VERSION
  s.authors     = ["edbo"]
  s.email       = ["ed@bitgamelabs.com"]
  s.homepage    = "https://github.com/bitgaming/odd_job"
  s.summary     = "Argument and Versioning for Active Job"
  s.description = "Contract enforcer for Active Job. Keep your arguments in check and version your Active Jobs!"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3", '~> 1.3'
end
