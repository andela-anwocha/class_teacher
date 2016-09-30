class TeacherClassesController < ApplicationController
  before_action :set_teacher

  def index
    @teacher_classes = TeacherClass.all
  end

  def new
    @teacher_class = @teacher.teacher_classes.new
  end

  def show
    @teacher_class = TeacherClass.find(params[:id])
  end

  def create
    @teacher_class = TeacherClass.new(class_params.merge(teacher_id: @teacher.id))

    if @teacher_class.save
      redirect_to teacher_class_path(@teacher_class),
       notice: "Class Created!, You can now add Students"
    else
      flash[:errors] = @teacher_class.errors
      render :new
    end
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: session[:teacher_id])
  end

  def class_params
    class_params = params.require(:teacher_class).permit(:name)
    class_params.merge(teacher_id: @teacher.id)
  end
end
