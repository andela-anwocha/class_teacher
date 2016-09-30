class Teacher < ActiveRecord::Base
  has_many :teacher_classes, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :email

  has_secure_password
end
