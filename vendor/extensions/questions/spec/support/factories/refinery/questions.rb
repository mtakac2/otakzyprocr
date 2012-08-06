
FactoryGirl.define do
  factory :question, :class => Refinery::Questions::Question do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

