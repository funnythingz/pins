# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pin do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    image '/hoge.jpg'
    sequence(:user_id) { |i| i }
  end
end