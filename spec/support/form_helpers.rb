module FormHelpers
  def sign_in_teacher(email, password)
    visit("/signin")
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_on("Sign In")
  end
end