# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :point do
    sequence(:title) { |n| title "I'm making a point! #{n}" }
  end
end
