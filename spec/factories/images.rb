FactoryBot.define do

  factory :image do
    # fixture = Rack::Test::UploadedFile.new('866-200x300.jpg', 'image/jpeg', true)
    image{ fixture_file_upload('866-200x300.jpg', 'image/jpeg', true) }
    suggest_id{ 1 }
  end
  # undefined method `fixture_file_upload' for #<FactoryBot::SyntaxRunner
  # factory :image_invalid, class: Image do
  #   image{ fixture_file_upload('test.html', 'text/html', false) }
  #   suggest_id{ 1 }
  # end
end
