class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by(email: params[:email])

    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to "/", notice: "Welcome #{teacher.name}"
    else
      flash[:errors] = ["Email or Password Invalid"]
      render :new
    end
  end
end
