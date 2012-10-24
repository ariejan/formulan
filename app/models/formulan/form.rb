module Formulan
  class Form < ActiveRecord::Base

    attr_accessor :fields

    # Define a new form.
    def self.define(identifier)
      form = Formulan::Form.new.tap do |f|
        f.identifier = identifier
        f.fields = []
        f.save
      end
    end
  end
end
