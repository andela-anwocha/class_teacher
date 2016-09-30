class AddTeacherToTeacherClass < ActiveRecord::Migration
  def change
    add_reference :teacher_classes, :teacher, index: true, foreign_key: true
  end
end
