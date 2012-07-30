
FactoryGirl.define do
  factory :politician, :class => Refinery::Politicians::Politician do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

