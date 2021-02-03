FactoryBot.define do
  # sequence (:user_name_sequence) { |n| "提案_#{n}" }
  password = Faker::Internet.password(min_length: 6)
  # 企業/個人事業Idはspecないで指定
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password }
    # password_confirmation { password }
    corporation_id { 1 }
    proprietorship_id { nil }

    trait :with_suggest do
      after(:build) do |user|
        user.suggests << create(:user_suggest, details: 'ddd' , user_id: user.id)
        user.suggests << create(:user_suggest, details: 'bbb' , user_id: user.id)
      end
    end
  end

  factory :user_suggest, class: Suggest do
    title { Faker::Job.field }
    details { '提案詳細' }
    category_id { rand(1..3) }
    user_id { 1 }
  end
  factory :user_prop, class: User do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password }
    # password_confirmation { password }
    corporation_id { nil }
    proprietorship_id { 1 }
  end
  factory :admin, class: User do
    user_name { '管理者' }
    email { 'admin_admin@co.jp' }
    password { password }
    password_confirmation { password }
    corporation_id { 1 }
    proprietorship_id { nil }
  end
end
