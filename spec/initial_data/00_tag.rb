count = 1
5.times do
  Tag.seed do |s|
    s.id = count
    s.name = "タグ_#{count}"
    count += 1
  end
end
