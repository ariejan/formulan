module Formulan

  # Defines a form
  class FormDefinition
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    attr_accessor :identifier, :fields

    # Never!
    def persisted?
      false
    end

    def initialize(identifier, &block)
      self.identifier = identifier
      self.fields = []

      instance_eval &block if block_given?

      fields.each do |field|
        class_eval "attr_accessor :#{field.name}"
      end
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
