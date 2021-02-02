# devise userの場合seedだと作成できないがcreateだと前の分が残り、バリデーションに引っかかる　→　db Cleaner導入したが上手くいかず。　結局はFactoryBotでlet! とbuildを使った方が良い
# User.create!(
#   id: 1,
#   user_name: '管理者',
#   email: 'admin@co.jp',
#   password: 'password',
#   password_confirmation: 'password',
#   admin: true,
#   corporation_id: 1
# )
# User.create!(
#   id: 2,
#   user_name: '一般ユーザ.prop',
#   email: 'user@co.jp',
#   password: 'password',
#   admin: false,
#   proprietorship_id: 1
# )
