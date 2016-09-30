require "rails_helper"

feature "Listing Class Students" do
  before do
    @teacher = create(:teacher)
    sign_in_teacher(@teacher.email, "password")
    @teacher_class = create(:teacher_class, teacher_id: @teacher.id)
  end

  context "when students are available" do
    scenario "lists all students available" do
      create(:student, name: "Name1", teacher_class_id: @teacher_class.id)

      visit teacher_class_students_path(@teacher_class)
      expect(page).to have_content("Name1")
    end
  end

  context "when students are not available" do
    scenario "displays no student added yet message" do
      visit teacher_class_students_path(@teacher_class)
      expect(page).to have_content("No Student Added Yet")
    end
  end
end
