FactoryBot.define do

  factory :message do
    user_id { 1 }
    room_id { 1 }
    text { Faker::Lorem.characters(number: 30) }#max 100
  end
end
