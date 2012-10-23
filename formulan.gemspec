# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formulan/version'

Gem::Specification.new do |gem|
  gem.name          = "Formulan"
  gem.version       = Formulan::VERSION
  gem.authors       = ["Ariejan de Vroom"]
  gem.email         = ["ariejan@ariejan.net"]
  gem.description   = %q{Formulan allows you to quickly define forms and store
    then in a database backend without the migrations hassle.}
  gem.summary       = %q{Data gathering made easy.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake', '~> 0.9.2.2'
end
