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

  describe Form do
    context "ActiveModel and ActiveRecord" do
      it { expect(subject).to allow_mass_assignment_of(:data) }

      it { expect(subject).to have_db_column(:identifier).
        of_type(:string) }
      it { expect(subject).to have_db_column(:data).
        of_type(:text) }

      it { expect(subject).to have_db_index(:identifier) }
      it { expect(subject).to serialize(:data) }
    end

    context "storing dat" do
      subject { Formulan::Form.create(data: { "test" => "result"}) }

      it "allows retrieval of data" do
        subject.reload
        expect(subject.data["test"]).to eq("result")
      end
    end
  end
end
