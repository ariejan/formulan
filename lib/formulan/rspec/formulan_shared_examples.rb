shared_examples_for "a formulan form", type: :integration do

  let!(:form) do
    Formulan.define :contact_form do
      string :name, label: "Your name"
      string :email, label: "Your email"
      text :message, label: "Your message"

      submit "Send message"
    end
  end

  describe "filling out form" do
    it "redirects to thanks" do
      fill_contact_form
      expect(page.current_path).to eq '/formulan/contact_form/thanks'
    end

    it "persists the submitted data" do
      expect {
        fill_contact_form
      }.to change { Formulan::Form.count }.by(1)
    end
  end

  def fill_contact_form
    visit '/formulan/contact_form'

    fill_in 'Your name', with: 'Sir Patrick Stewart'
    fill_in 'Your email', with: 'captain@patrickstewart.co.uk'
    fill_in 'Your message', with: 'Make is so!'

    click_button 'Send message'
  end
end
