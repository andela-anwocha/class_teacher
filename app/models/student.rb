class Student < ActiveRecord::Base
  validates_presence_of(:name)
  validates_numericality_of(:age)

  belongs_to :teacher_class
end
