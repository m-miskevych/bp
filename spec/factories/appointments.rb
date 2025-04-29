FactoryBot.define do
  factory :appointment do
    start_at { 2.days.from_now }
    end_at { 2.days.from_now + 1.hour }
    association :client, factory: :user
    association :session_slot
    status { 1 }
  end
end
