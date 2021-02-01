count = 1
names = ['農林水産業', '建設業', '食品加工業', '製造業', '小売業', '情報通信業', '運輸業', '不動産業', '教育・福祉複合サービス業', 'サービス業', 'その他']

names.each do |name|
  Category.seed do |s|
    s.id = count
    s.name = name
    count += 1
  end
end
