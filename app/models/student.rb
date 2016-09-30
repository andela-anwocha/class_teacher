class Student < ActiveRecord::Base
  belongs_to :teacher_class

  validates_presence_of(:name)
  validates_numericality_of(:age)
end
