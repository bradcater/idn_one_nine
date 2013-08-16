# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'idn_one_nine/version'

Gem::Specification.new do |gem|
  gem.name          = "idn_one_nine"
  gem.version       = IdnOneNine::VERSION
  gem.authors       = ["Neil Slater"]
  gem.email         = ["bradcater@gmail.com"]
  gem.description   = %q{This is a port of Erik Abele's IDN gem to Ruby 1.9.}
  gem.summary       = %q{This is a port of Erik Abele's IDN gem to Ruby 1.9.}
  gem.homepage      = "https://github.com/bradcater/idn_one_nine"

  gem.add_development_dependency "rspec", ">= 2.13.0"
  gem.add_development_dependency "rake", ">= 1.9.1"
  gem.add_development_dependency "rake-compiler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.extensions    = gem.files.grep(%r{/extconf\.rb$})
  gem.require_paths = ["lib"]
end
