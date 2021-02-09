FactoryBot.define do
  factory :corporation do
    name { Faker::Company.name }
    # info { Faker::String.random(length: 5..2000) }
    info { Faker::Lorem.sentences }
    category_id { 2 }
  end
end
