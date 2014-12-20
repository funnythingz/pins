# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'password'
    nickname Faker::Name.first_name.downcase
    role 'member'
  end
end
