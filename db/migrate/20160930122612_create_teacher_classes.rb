class CreateTeacherClasses < ActiveRecord::Migration
  def change
    create_table :teacher_classes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
