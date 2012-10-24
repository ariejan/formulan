module Formulan
  class Engine < ::Rails::Engine
    isolate_namespace Formulan

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(formulan.css formulan.js)
    end
  end
end
