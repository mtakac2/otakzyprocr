
FactoryGirl.define do
  factory :politician, :class => Refinery::Politicians::Politician do
    sequence(:firstname) { |n| "refinery#{n}" }
  end
end

