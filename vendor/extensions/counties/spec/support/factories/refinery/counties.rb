
FactoryGirl.define do
  factory :county, :class => Refinery::Counties::County do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

