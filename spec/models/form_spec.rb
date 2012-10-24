require 'spec_helper'

module Formulan
  describe Form do
    describe "#self.define" do
      subject { Formulan::Form.define :my_form }

      its(:identifier) { expect(subject).to eq :my_form }
      its(:fields)     { expect(subject).to be_empty }
    end
  end
end
