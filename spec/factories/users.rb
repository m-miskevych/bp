FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    name { "John Doe" }
    password { "password" }
    password_confirmation { "password" }
    role { :admin }
  end
end
