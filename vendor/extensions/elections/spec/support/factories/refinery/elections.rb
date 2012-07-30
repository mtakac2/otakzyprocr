
FactoryGirl.define do
  factory :election, :class => Refinery::Elections::Election do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

