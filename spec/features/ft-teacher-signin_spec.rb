require "rails_helper"

feature "Teacher Signin" do
  context "when correct credentials are provided" do
    before{ @teacher = create(:teacher) }

    scenario "displays Welcome message" do
      visit("/signin")
      fill_in(:email, with: @teacher.email)
      fill_in(:password, with: "password")
      click_on("Sign In")

      expect(page).to have_content("Welcome #{@teacher.name}")
    end
  end

  context "when incorrect credentials are provided" do
    scenario "displays Email or Password Invalid Error" do
      visit("/signin")
      fill_in(:email, with: @teacher.email)
      fill_in(:password, with: "")
      click_on("Sign In")

      expect(page).to have_content("Email or Password Invalid")
    end
  end
end
