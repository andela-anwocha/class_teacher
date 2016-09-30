require "rails_helper"

feature "Adding Students To Class" do
  before do
    @teacher = create(:teacher)
    sign_in_teacher(@teacher.email, "password")
    @teacher_class = create(:teacher_class, teacher_id: @teacher.id)
  end

  context "when user provides valid data" do
    before do
      params = { name: "Name", age: 10 }
      fill_form_for_adding_students(@teacher_class, params)
    end

    scenario "creates the student" do
      expect(Student.count).to eq(1)
    end
  end

  context "when user does not provide valid data" do
    before do
      params = { name: "", age: 10 }
      fill_form_for_adding_students(@teacher_class, params)
    end

    scenario "displays Errors" do
      expect(page).to have_content("Errors")
    end
  end
end
