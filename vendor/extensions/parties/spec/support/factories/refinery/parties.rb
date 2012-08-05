
FactoryGirl.define do
  factory :party, :class => Refinery::Parties::Party do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

