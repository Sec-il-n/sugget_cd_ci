# タグ(seed管理)
5.times do |n|
  name = "タグ#{n + 1}"
  Tag.create!(
    name: name
  )
end

# カテゴリー(seed管理)
names = ['農林水産業', '建設業', '食品加工業', '製造業', '小売業', '情報通信業', '運輸業', '不動産業', '教育・福祉複合サービス業', 'サービス業', 'その他']
names.each do |name|
  Category.create!(
    name: name
  )
end

# corporation
20.times do |n|
  name = "#{Faker::Company.name}.corp"
  info = "#{Faker::Lorem.characters(1000)}"#max3000
  image = nil
  category_id = rand(1..11)
  corporation = Corporation.create!(
    name: name,
    info: info,
    image: image,
    category_id: category_id,
  )
    user_name = Faker::Name.name
    email = "user_#{n}_corp@hoge#{n}.jp"
    password = "password"
    user_image = nil
    admin = false
    # admin = [true, false].sample
    corporation_id = corporation.id
    proprietorship_id = nil
    user = User.create!(
      user_name: user_name,
      email: email,
      password: password,
      # password_confirmation: password,
      user_image: user_image,
      admin: admin,
      corporation_id: corporation_id,
      proprietorship_id: proprietorship_id,
      confirmed_at: Time.now
    )
      user_id = user.id
      title = "提案#{n}-#{user.id}"
      details = "ddd"
      category_id = corporation.category_id
      suggest = Suggest.create!(
        user_id: user_id,
        title: title,
        details: details,
        category_id: category_id
      )
end

# Proprietorship
20.times do |n|
  name = "#{Faker::Name.name}.prop"
  info = "#{Faker::Lorem.sentences}"
  image = nil
  category_id = rand(1..11)#複数
  proprietorship = Proprietorship.create!(
    name: name,
    info: info,
    image: image,
    category_id: category_id,
  )
  email = "prop_#{n}_@hoge#{n}.jp"
  user_name = Faker::Name.name
  user_image = nil
  password = "password"
  proprietorship_id = proprietorship.id
  admin = false
  user = User.create!(
    email: email,
    user_name: user_name,
    password: password,
    # password_confirmation: password,
    user_image: user_image,
    admin: admin,
    proprietorship_id: proprietorship_id,
    confirmed_at: Time.now
  )
    user_id = user.id
    title = "提案#{n}-#{user.id}"
    details = "ddd"
    category_id = proprietorship.category_id
    suggest = Suggest.create!(
      user_id: user_id,
      title: title,
      details: details,
      category_id: category_id
    )
end

# 管理者
1.times do |n|
  email = "admin_1#{n}@hoge#{n}.jp"
  user_name = Faker::Name.name
  user_image = nil
  password = "password"
  admin = true
  user = User.create!(
    email: email,
    user_name: user_name,
    password: password,
    # password_confirmation: password,
    admin: admin,
    confirmed_at: Time.now
  )
end
