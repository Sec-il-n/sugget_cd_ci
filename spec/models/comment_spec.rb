require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント機能' do
    let!(:user) { create(:user) }
    let!(:user_2) { create(:user) }
    let!(:suggest) { create(:suggest, user_id: user.id) }
    let!(:comment) { create(:comment, user_id: user_2.id, suggest_id: suggest.id) }
    context'コメント内容が未入力の時' do
      it 'バリデーションに引っかかる' do
        # build->createだとその時点でdbのバリデーションに引っかかってエラーになる
        comment = build(:comment, text: '')
        comment.valid?
        expect(comment.errors.full_messages).to include('コメントを入力してください')
      end
    end
    context'コメントが300字以上の時' do
      it 'バリデーションに引っかかる' do
        comment = build(:comment, text: Faker::String.random(length: 301))
        comment.valid?
        expect(comment.errors.full_messages).to include('コメントは300文字以内で入力してください')
      end
    end
  end
end
