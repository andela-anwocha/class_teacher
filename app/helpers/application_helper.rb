module ApplicationHelper
  def current_teacher
    Teacher.find(session[:teacher_id])
  end
end
