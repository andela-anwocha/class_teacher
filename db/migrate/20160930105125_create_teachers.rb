class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end
