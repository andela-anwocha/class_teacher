require "rails_helper"

feature "Signing Up Teacher" do
  context "when valid data is provided" do
    before do
      fill_form_for_signup("Teacher")
    end

    scenario "creates an account for teacher" do
      expect(Teacher.count).to eq(1)
    end

    scenario "displays welcome message" do
      expect(page).to have_content("Welcome Teacher")
    end
  end

  context "when valid data is not provided" do
    scenario "displays error messages" do
      fill_form_for_signup("")

      expect(page).to have_content("Errors")
    end
  end
end
