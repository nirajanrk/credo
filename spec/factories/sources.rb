# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :source do
    type ""
    sequence(:title) { |n| "Factory title #{n}" }
    year "MyString"
    journal "MyText"
    description "MyText"
    citation 1
    url "MyText"
  end
end
