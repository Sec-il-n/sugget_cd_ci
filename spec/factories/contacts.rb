FactoryBot.define do
  factory :contact do
    user_id { nil }
    content { Faker::Lorem.questions }
    # content { Faker::String.random(length: 5..600) }
  end
end
