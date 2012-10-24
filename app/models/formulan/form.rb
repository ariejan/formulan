module Formulan
  # Hash containing defined forms
  def self.forms
    @forms ||= {}
  end

  def self.fetch(identifier)
    identifier = identifier.to_sym if identifier.is_a?(String)
    forms.fetch(identifier, nil)
  end

  # Convenience method for Formulan::FormDefinition.new
  def self.define(identifier, &block)
    forms[identifier] = FormDefinition.new(identifier, &block)
  end

  # Actual ActiveRecord class to store submitted
  # form data.
  class Form < ActiveRecord::Base
    attr_accessible :data

    serialize :data
  end
end
