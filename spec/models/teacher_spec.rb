require "rails_helper"

RSpec.describe Teacher, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to have_many(:teacher_classes) }
  it { is_expected.to have_secure_password }
end
