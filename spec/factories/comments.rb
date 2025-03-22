FactoryBot.define do
  factory :comment do
    association :user
    association :user_plan
    body { "This is a test comment" }
  end
end
