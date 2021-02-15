FactoryBot.define do
  factory :proprietorship do
    name { Faker::Company.name }
    info { Faker::Base.regexify("[aあbい]{1000}") }
    category_id { 1 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/866-200x300.jpg'), 'image/jpeg') }
  end
end
