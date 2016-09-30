require "rails_helper"

feature "Teacher Signin" do
  before { @teacher = create(:teacher) }

  context "when correct credentials are provided" do
    scenario "displays Welcome message" do
      sign_in_teacher(@teacher.email, "password")
      expect(page).to have_content("Welcome #{@teacher.name}")
    end
  end

  context "when incorrect credentials are provided" do
    scenario "displays Email or Password Invalid Error" do
      sign_in_teacher(@teacher.email, "")
      expect(page).to have_content("Email or Password Invalid")
    end
  end
end
