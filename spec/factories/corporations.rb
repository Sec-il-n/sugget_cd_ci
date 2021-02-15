FactoryBot.define do
  factory :corporation do
    name { Faker::Company.name }
    info { Faker::Base.regexify("[aあbい]{1000}") }
    # info { Faker::String.random(length: 5..2000) }
    # info { Faker::Lorem.characters(number: 1000) }
    category_id { 2 }
  end
end
