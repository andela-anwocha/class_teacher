class TeacherClass < ActiveRecord::Base
  has_many :students, dependent: :destroy
  belongs_to :teacher

  validates_presence_of :name
end
