FactoryBot.define do
  sequence (:suggest_title_sequence) { |n| "提案_#{n}" }

  factory :suggest do
    title { Faker::Job.field }
    details { '提案詳細' }
    category_id { rand(1..3) }
    user_id { 1 }

    trait :suggest_with_tags do
      after(:build) do |suggest|
          suggest.suggest_tags << create(:suggest_tags, suggest_id: suggest.id, tag_id: rand(1..2))
      end
    end
    # trait :suggest_with_tags_3 do
    #   after(:build) do |suggest|
    #     count = 1
    #     3.times do
    #       suggest.suggest_tags << create(:suggest_tags, suggest_id: suggest.id, tag_id: count)
    #       count += 1
    #     end
    #   end
    # end
  end
  factory :suggest_1, class: Suggest do
    title { generate :suggest_title_sequence }
    details { '提案詳細' }
    category_id { rand(1..3) }
  end

  factory :suggest_tags, class: SuggestTag do
    tag_id { rand(1..5) }
  end
end
