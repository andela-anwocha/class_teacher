require "rails_helper"

feature "Signing Up Teacher" do
  context "when valid data is provided" do
    before do
      visit("/signup")

      fill_in(:name, with: "Teacher")
      fill_in(:email, with: "user@email.com")
      fill_in(:password, with: "password")
      click_on("Sign Up")
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
      visit("/signup")

      fill_in(:name, with: "")
      fill_in(:email, with: "user@email.com")
      fill_in(:password, with: "password")
      click_on("Sign Up")

      expect(page).to have_content("Errors")
    end
  end
end