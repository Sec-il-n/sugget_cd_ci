FactoryBot.define do
  factory :proprietorship do
    name { Faker::Company.name }
    info { Faker::Lorem.characters(600) }# max 1000
    category_id { 1 }
  end
end
