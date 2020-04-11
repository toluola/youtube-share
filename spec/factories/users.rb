# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      username { 'testuser' }
      password { 'test123' }
    end
end
