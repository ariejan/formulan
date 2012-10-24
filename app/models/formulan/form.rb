module Formulan

  # Hash containing defined forms
  def self.forms
    @forms ||= {}
  end

  # Convenience method for Formulan::FormDefinition.new
  def self.define(identifier, &block)
    forms[identifier] = FormDefinition.new(identifier, &block)
  end

  # Actual ActiveRecord class to store submitted
  # form data.
  class Form < ActiveRecord::Base
  end
end
