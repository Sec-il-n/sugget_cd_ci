FactoryBot.define do
  factory :tag do
    # name { Faker::String.random(length: 5..20) }
    name { Faker::Lorem.word }
  end
end
