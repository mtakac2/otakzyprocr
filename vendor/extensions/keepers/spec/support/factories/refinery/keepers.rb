
FactoryGirl.define do
  factory :keeper, :class => Refinery::Keepers::Keeper do
    sequence(:firstname) { |n| "refinery#{n}" }
  end
end

