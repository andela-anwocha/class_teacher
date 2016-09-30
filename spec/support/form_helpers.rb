module FormHelpers
  def sign_in_teacher(email, password)
    visit("/signin")
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_on("Sign In")
  end

  def fill_form_for_adding_students(teacher_class, params = {})
    visit new_teacher_class_student_path(teacher_class)
    fill_in(:name, with: params[:name])
    fill_in(:age, with: params[:age])

    click_on("Add Student")
  end

  def fill_form_for_class(params = {})
    visit new_teacher_class_path
    fill_in(:name, with: params[:name])
    click_on("Add Class")
  end

  def fill_form_for_signup(name)
    visit("/signup")

    fill_in(:name, with: name)
    fill_in(:email, with: "user@email.com")
    fill_in(:password, with: "password")
    click_on("Sign Up")
  end
end
