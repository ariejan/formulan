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

  s.files = Dir["{app,config,db,lib}/**/*"] + 
    ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "database_cleaner"
end
