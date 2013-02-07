# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :evidence do
    sequence(:title) { |n| title "I'm making a point! #{n}" }
  end
end
