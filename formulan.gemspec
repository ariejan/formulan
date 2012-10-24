$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "formulan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "formulan"
  s.version     = Formulan::VERSION
  s.authors     = ["Ariejan de Vroom"]
  s.email       = ["ariejan@ariejan.net"]
  s.homepage    = "https://github.com/ariejan/formulan"
  s.summary     =
    "Easy way to create forms and serialize them to your database."
  s.description =
    "No more hassle with contact forms or survey. Formulan stores
     submitted data serialized in your database for later processing."

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = %w(lib app)

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "activemodel", "~> 3.2.8"
  s.add_dependency "haml", "~> 3.1.7"
  s.add_dependency "simple_form", "~> 2.0.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "database_cleaner"
end
