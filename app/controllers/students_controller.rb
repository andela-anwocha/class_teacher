class StudentsController < ApplicationController
  before_action :set_teacher_class

  def index
    @students = @teacher_class.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to teacher_class_students_path(@teacher_class),
                  notice: "Student Created!"
    else
      flash[:errors] = @student.errors
      render :new
    end
  end

  private

  def set_teacher_class
    @teacher_class = TeacherClass.find(params[:teacher_class_id])
  end

  def student_params
    student_params = params.require(:student).permit(:name, :age)
    student_params.merge(teacher_class_id: @teacher_class.id)
  end
end
