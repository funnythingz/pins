# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pin do
    title Faker::Lorem.word
    description Faker::Lorem.sentence
    image '/hoge.jpg'
    sequence(:user_id) { |i| i }
  end
end