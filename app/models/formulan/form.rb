module Formulan
  # Actual ActiveRecord class to store submitted
  # form data.
  class Form < ActiveRecord::Base
    attr_accessible :data

    serialize :data
  end
end
