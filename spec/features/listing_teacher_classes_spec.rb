require "rails_helper"

feature "Listing Teacher Classes" do
  before do
    @teacher = create(:teacher)
    sign_in_teacher(@teacher.email, "password")
  end

  context "when classes are available" do
    scenario "displays the class names" do
      create_list(:teacher_class, 3, teacher_id: @teacher.id)
      visit teacher_classes_path
      expect(page).to have_content(TeacherClass.first.name)
    end
  end

  context "when classes are not available" do
    scenario "displays no class found" do
      visit teacher_classes_path
      expect(page).to have_content("No Class Found")
    end
  end
end
