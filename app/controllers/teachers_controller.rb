class TeachersController < ApplicationController  
  def home
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to "/", notice: "Welcome #{@teacher.name}"
    else
      flash[:errors] = @teacher.errors
      render :new
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
