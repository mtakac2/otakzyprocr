
FactoryGirl.define do
  factory :email, :class => Refinery::Emails::Email do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

