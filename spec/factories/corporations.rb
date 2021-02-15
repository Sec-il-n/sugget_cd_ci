FactoryBot.define do
  factory :corporation do
    name { Faker::Company.name }
    info { Faker::Base.regexify("[aあbい]{1000}") }
    category_id { 2 }
    # 画像モック
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/866-200x300.jpg'), 'image/jpeg') }
  end
end
