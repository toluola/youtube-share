# spec/models/user_spec.rb
require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the videos model
  it { should have_many(:videos) }
  # Validation tests
  # ensure username and password_digest are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
end