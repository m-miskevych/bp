# spec/factories/plans.rb
FactoryBot.define do
  factory :plan do
    sequence(:name) { |n| "Sample Plan #{n}" }
    description { "This is a sample description for the plan." }
  end
end
