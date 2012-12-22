# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debate do
    sequence(:title) { |n| "Factory title #{n}" }
  end
end
