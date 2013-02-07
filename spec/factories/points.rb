FactoryGirl.define do
  factory :point do
    association :evidence, factory: :evidence
    association :debate, factory: :debate
    supporting { true }
  end
end
