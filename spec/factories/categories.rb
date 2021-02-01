FactoryBot.define do
  names = ['農林水産業', '建設業', '食品加工業', '製造業', '小売業', '情報通信業', '運輸業', '不動産業', '教育・福祉複合サービス業', 'サービス業', 'その他']
  sequence (:category_name_sequence) { |n| names[n - 1] }
  factory :category do
    name { generate :category_name_sequence }
  end
end
