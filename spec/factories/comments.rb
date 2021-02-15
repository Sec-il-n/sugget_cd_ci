FactoryBot.define do
  # sequence (:comment_text_sequence){ |n|  }
  factory :comment do
    user_id { 1 }
    suggest_id { 1 }
    # text { 'abodiekifro' }
    text { Faker::Food.description }
    # text { Faker::String.random(length: 10) }
  end
end
