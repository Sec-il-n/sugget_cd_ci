# 1.times do |n|
#   # name = "#{Faker::Name.name}.corp"
#   # info = "aaa"
#   # image = nil
#   # category = [1,2,3].sample
#   # corporation = Corporation.create!(
#   #   name: name,
#   #   info: info,
#   #   image: image,
#   #   category: category
#   # )
#   user_name = Faker::Name.name
#   email = "user_1_#{n}@hoge#{n}.jp"
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
# end

1.times do |n|
  name = "#{Faker::Name.name}.prop"
  info = "aaa"
  image = nil
  category = [1,2,3].sample#複数
  proprietorship = Proprietorship.create!(
    name: name,
    info: info,
    image: image,
    category: category,
  )
  email = "user_prop#{n}@hoge#{n}.jp"
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
end
# 5.times do |n|
#   name = "タグ#{n + 1}"
#   Tag.create!(
#     name: name
#   )
# end
