module Formulan
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(formulan.css formulan.js)
    end

    config.after_initialize do
      Dir[Rails.root.join("app/forms/**/*_form.rb")].each {|f| require f}
    end
  end
end

