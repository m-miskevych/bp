FactoryBot.define do
  factory :exercises_plan do
    association :exercise
    association :plan
  end
end
