require 'rails_helper'

RSpec.describe Video, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the videos model
  it { should belong_to(:user) }
  # Validation tests
  # ensure username and password_digest are present before save
  it { should validate_presence_of(:link) }
end
