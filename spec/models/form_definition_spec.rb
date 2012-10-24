require 'spec_helper'

module Formulan
  describe "#self.define" do
    context "with an empty form" do
      subject { Formulan.define :my_form }

      its(:identifier) { expect(subject).to eq :my_form }
      its(:fields)     { expect(subject).to be_empty }
    end

    context "with a form" do
      subject {
        Formulan.define :my_form do
          string :email, label: "Your email"
          text :message, label: nil
          submit "Send now"
        end
      }

      its(:identifier) { expect(subject).to eq :my_form }
      its(:fields)     { expect(subject).to have(3).elements }
    end
  end

  describe "field types" do
    describe "string" do
      let(:form) {
        Formulan.define(:my_form) do
          string :email
        end
      }

      subject { form.fields.first }

      its(:name) { expect(subject).to eq :email }
      its(:type) { expect(subject).to eq :string }
    end

    describe "text" do
      let(:form) {
        Formulan.define(:my_form) do
          text :comment
        end
      }

      subject { form.fields.first }

      its(:name) { expect(subject).to eq :comment }
      its(:type) { expect(subject).to eq :text }
    end

    describe "submit" do
      let(:form) {
        Formulan.define(:my_form) do
          submit "My button"
        end
      }

      subject { form.fields.first }

      its(:name)  { expect(subject).to eq :submit }
      its(:type)  { expect(subject).to eq :submit }
      its(:label) { expect(subject).to eq "My button" }
    end
  end
end
