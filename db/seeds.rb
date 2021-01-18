# 1.times do |n|
#   name = "#{Faker::Name.name}.prop"
#   info = "aaa"
#   image = nil
#   category_id = rand(1..11)#複数
#   corporation = Corporation.create!(
#     name: name,
#     info: info,
#     image: image,
#     category_id: category_id,
#   )
#   user_name = Faker::Name.name
#   email = "user_#{n}@hoge#{n}.jp"
#   password = "password"
#   user_image = nil
#   admin = false
#   corporation_id = corporation.id
#   proprietorship_id = nil
#   user = User.create!(
#     user_name: user_name,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     user_image: user_image,
#     admin: admin,
#     corporation_id: corporation_id,
#     proprietorship_id: proprietorship_id
#   )
#     user_id = user.id
#     title = "テスト#{n}-#{user.id}"
#     details = "ddd"
#     category_id = corporation.category_id
#     suggest = Suggest.create!(
#       user_id: user_id,
#       title: title,
#       details: details,
#       category_id: category_id
#     )
# end

# Proprietorship

1.times do |n|
  name = "#{Faker::Name.name}.prop"
  info = "aaa"
  image = nil
  category_id = rand(1..11)#複数
  proprietorship = Proprietorship.create!(
    name: name,
    info: info,
    image: image,
    category_id: category_id,
  )
  email = "prop_1#{n}@hoge#{n}.jp"
  user_name = Faker::Name.name
  # user_image =
  password = "password"
  proprietorship_id = proprietorship.id
  admin = false
  user = User.create!(
    email: email,
    user_name: user_name,
    password: password,
    # password_confirmation: password,
    admin: admin,
    proprietorship_id: proprietorship_id
  )
  user_id = user.id
  title = "テスト#{n}-#{user.id}"
  details = "ddd"
  category_id = proprietorship.category_id
  suggest = Suggest.create!(
    user_id: user_id,
    title: title,
    details: details,
    category_id: category_id
  )
end

# タグ(seed管理)
# 5.times do |n|
#   name = "タグ#{n + 1}"
#   Tag.create!(
#     name: name
#   )
# end

# カテゴリー(seed管理)
# names = ['農林水産業', '建設業', '食品加工業', '製造業', '小売業', '情報通信業', '運輸業', '不動産業', '教育・福祉複合サービス業', 'サービス業', 'その他']
# names.each do |name|
#   Category.create!(
#     name: name
#   )
# end
