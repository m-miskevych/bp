# spec/factories/plans.rb
FactoryBot.define do
  factory :plan do
    name { "Sample Plan" }
    description { "This is a sample description for the plan." }
  end
end
