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
  end
  factory :user_popr, class: User do
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
