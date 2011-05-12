# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "sinatra-accept-params"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nate Wiger", "Felix Gilcher"]
  s.email       = ["nate@wiger.org", "felix.gilcher@asquera.de"]
  s.summary     = %q{Parameter whitelisting for Sinatra}
  s.description = %q{Parameter whitelisting for Sinatra.  Provides validation, defaults, and post-processing.}
  s.homepage    = "http://github.com/nateware/sinatra-accept-params"
  
  s.files = %w( README.md Rakefile LICENSE VERSION )
  s.files += Dir.glob("lib/**/*")
  
  s.require_paths = ["lib"]
  
  s.add_development_dependency(%q<bacon>)
end