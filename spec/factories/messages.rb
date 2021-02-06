FactoryBot.define do

  factory :message do
    user_id { 1 }
    room_id { 1 }
    text { Faker::String.random(length: 10..100) }
  end
end
