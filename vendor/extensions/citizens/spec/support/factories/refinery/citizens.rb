
FactoryGirl.define do
  factory :citizen, :class => Refinery::Citizens::Citizen do
    sequence(:firstname) { |n| "refinery#{n}" }
  end
end

