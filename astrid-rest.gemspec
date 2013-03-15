# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astrid/rest/version'

Gem::Specification.new do |spec|
  spec.name          = "astrid-rest"
  spec.version       = Astrid::Rest::VERSION
  spec.authors       = ["Patrick Aikens"]
  spec.email         = ["paikens@gmail.com"]
  spec.description   = %q{A Ruby wrapper around the Astrid task manager RESTful API}
  spec.summary       = %q{Astrid RESTful Ruby Wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
end
