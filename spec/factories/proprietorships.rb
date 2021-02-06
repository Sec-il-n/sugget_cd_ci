FactoryBot.define do
  factory :proprietorship do
    name { Faker::Company.name }
    info { Faker::String.random(length: 5..2000) }
    category_id { 1 }
  end
end
