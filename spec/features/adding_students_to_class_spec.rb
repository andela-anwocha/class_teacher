require "rails_helper"

feature "Adding Students To Class" do
  context "when user provides valid data" do
    before do
      @teacher = create(:teacher)
      sign_in_teacher(@teacher.email, "password")
      @teacher_class = create(:teacher_class, teacher_id: @teacher.id)
      visit new_teacher_class_student_path(@teacher_class)

      fill_in(:name, with: "Name")
      fill_in(:age, with: 10)

      click_on("Add Student")
    end

    scenario "creates the student" do
      expect(Student.count).to eq(1)
    end
  end

  context "when user does not provide valid data" do
    before do
      @teacher = create(:teacher)
      sign_in_teacher(@teacher.email, "password")
      @teacher_class = create(:teacher_class, teacher_id: @teacher.id)
      visit new_teacher_class_student_path(@teacher_class)

      fill_in(:name, with: "")
      fill_in(:age, with: 10)

      click_on("Add Student")
    end

    scenario "displays Errors" do
      expect(page).to have_content("Errors")
    end
  end
end