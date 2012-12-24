FactoryGirl.define do
  factory :debates_point do
    association :point, factory: :point
    association :debate, factory: :debate
    supporting { true }
  end
end
