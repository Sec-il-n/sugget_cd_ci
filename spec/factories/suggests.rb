FactoryBot.define do
  sequence (:suggest_title_sequence) { |n| "提案_#{n}" }

  factory :suggest do
    title { '提案' }
    details { '提案詳細' }
  end
  factory :suggest_1, class: Suggest do
    title { generate :suggest_title_sequence }
    details { '提案詳細' }
    # 1を管理者にする
    # user_id{ rand(2..10) }
    category_id { rand(1..3) }
  end
  factory :suggest_2, class: Suggest do
    title { generate :suggest_title_sequence }
    details { '提案詳細' }
    category_id { 3 }
  end
end
