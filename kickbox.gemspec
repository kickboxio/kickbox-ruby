# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = "kickbox"
  gem.version     = "2.0.5"
  gem.description = "Official kickbox API library client for ruby"
  gem.summary     = "Official kickbox API library client for ruby"

  gem.author   = "Chaitanya Surapaneni"
  gem.email    = "chaitanya.surapaneni@kickbox.com"
  gem.homepage = "https://kickbox.com"
  gem.license  = "MIT"

  gem.require_paths = ['lib']

  gem.files = Dir["lib/**/*"]

  gem.add_dependency "faraday", "~> 2.0"
  gem.add_dependency "json", "~> 2.0"
end
