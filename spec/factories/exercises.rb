FactoryBot.define do
  factory :exercise do
    name { "Sample Exercise" }
    description { "This is a sample description for the exercise." }
    set { rand(1..5) }
    repetition { rand(5..20) }
  end
end
