module Formulan

  # Defines a form
  class FormDefinition
    attr_accessor :identifier, :fields

    def initialize(identifier, &block)
      self.identifier = identifier
      self.fields = []

      instance_eval &block if block_given?
    end

    def string(name, options = {})
      fields << Formulan::Field.new(:string, name, options)
    end

    def text(name, options = {})
      fields << Formulan::Field.new(:text, name, options)
    end

    def submit(label, options = {})
      fields << Formulan::Field.new(:submit, :submit, label: label)
    end
  end
end
