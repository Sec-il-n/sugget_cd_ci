FactoryBot.define do

  factory :comment do
    user_id { 1 }
    suggest_id { 1 }
    text { Faker::String.random(length: 10..300) }
  end
end
