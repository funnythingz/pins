require 'faker'

FactoryGirl.define do
  factory :pin do
    title Faker::Lorem.word
    description Faker::Lorem.sentence
    image '/hoge.jpg'
    sequence(:user_id) { |i| i }

    factory :pin_public do
      status 'public'
    end

    factory :pin_private do
      status 'private'
    end
  end
end
