module Formulan
  # Actual ActiveRecord class to store submitted
  # form data.
  class Form < ActiveRecord::Base
    set_table_name 'formulan_forms'

    attr_accessible :data

    serialize :data
  end
end
