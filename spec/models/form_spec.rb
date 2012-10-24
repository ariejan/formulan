require 'spec_helper'

module Formulan
  describe 'self' do
    it "calls FormDefinition.new" do
      Formulan::FormDefinition.should_receive(:new).with(:my_form)
      Formulan.define :my_form do
      end
    end

    it "stores the generated form definition" do
      Formulan.define :my_form do
      end
      expect(Formulan.forms[:my_form]).to be_a(Formulan::FormDefinition)
    end
  end
end
