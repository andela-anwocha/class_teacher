class Teacher < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :email

  has_secure_password
  has_many :teacher_classes, dependent: :destroy
end
