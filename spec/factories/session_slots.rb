FactoryBot.define do
  factory :session_slot do
    name { "Test Session" }
    available_at { 2.days.from_now }
    duration { 60 }
    association :physiotherapist, factory: :user
  end
end
