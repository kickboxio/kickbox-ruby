# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name        = "kickbox"
  gem.version     = "1.0.4"
  gem.description = "Official kickbox API library client for ruby"
  gem.summary     = "Official kickbox API library client for ruby"

  gem.author   = "Chaitanya Surapaneni"
  gem.email    = "chaitanya.surapaneni@kickbox.io"
  gem.homepage = "http://kickbox.io"
  gem.license  = "MIT"

  gem.require_paths = ['lib']

  gem.files = Dir["lib/**/*"]

  gem.add_dependency "faraday", "~> 0.8.8"
  gem.add_dependency "json", ">= 1.7.7"
end
