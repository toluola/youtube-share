# spec/factories/video.rb
FactoryBot.define do
    factory :video do
      link { 'https://github.com/toluola' }
      user_id { User.first.id }
    end
end