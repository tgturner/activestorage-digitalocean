$:.push File.expand_path("lib", __dir__)

require File.expand_path('lib/activestorage-digitalocean/version')

Gem::Specification.new do |gem|
  gem.name                  = "activestorage-digitalocean"
  gem.version               =  ActiveStorageDigitalOcean::VERSION
  gem.date                  = "2010-04-28"

  gem.summary               = "ActiveStorage wrapper for DigitalOcean Spaces"
  gem.description           = "A library for interacting with DigitalOcean Spaces through ActiveStorage"

  gem.authors               = ["Graham Turner"]
  gem.email                 = "turnertgraham@gmail.com"
  gem.homepage              = "https://github.com/tgturner/activestorage-digitalocean"
  gem.license               = "MIT"

  gem.require_paths         = ["lib"]
  gem.files                 = Dir['{app,config,db,lib}/**/*']
  gem.required_ruby_version = ">= 1.9.2"

  gem.add_runtime_dependency "activestorage", ">= 5.2"
  gem.add_runtime_dependency "aws-sdk-s3", "~> 1"
end