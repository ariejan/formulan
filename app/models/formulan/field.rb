module Formulan
  class Field
    attr_accessor :name, :type, :label

    def initialize(type, name, options = {})
      self.name = name
      self.type = type
      self.label = options.fetch(:label, name.to_s.humanize)
    end
  end
end
