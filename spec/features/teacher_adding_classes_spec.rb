require "rails_helper"

feature "Teachers Adding Classes" do
  context "when a name is provided" do
    before do
      @teacher = create(:teacher)
      sign_in_teacher(@teacher.email, "password")

      visit new_teacher_class_path
      fill_in(:name, with: "Primary 1")
      click_on("Add Class")
    end

    scenario "creates the teacher_class" do
      expect(TeacherClass.count).to eq(1)
    end

    scenario "displays the class name" do
      expect(page).to have_content("Primary 1")
    end
  end

  context "when a name is not provided" do
    scenario "displays invalid class name" do
      @teacher = create(:teacher)
      sign_in_teacher(@teacher.email, "password")
      visit new_teacher_class_path

      fill_in(:name, with: "")
      click_on("Add Class")
      expect(page).to have_content("Invalid Name")    
    end
  end
end
