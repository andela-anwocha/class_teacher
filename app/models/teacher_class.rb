class TeacherClass < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :teacher

  has_many :students, dependent: :destroy
end
