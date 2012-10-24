shared_examples_for "a formulan form", type: :integration do

  let!(:form) do
    Formulan.define :contact_form do
      string :name, label: "Your name"
      string :email, label: "Your email"
      text :message, label: "Your message"

      submit "Send message"
    end
  end

  describe "fill out form" do
    it "accepts and redirects to thanks" do
      visit '/formulan/contact_form'

      fill_in 'Your name', with: 'Sir Patrick Stewart'
      fill_in 'Your email', with: 'captain@patrickstewart.co.uk'
      fill_in 'Your message', with: 'Make is so!'

      click_button 'Send message'

      expect(page.current_path).to eq '/formulan/contact_form/thanks'
    end
  end
end
