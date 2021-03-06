require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録機能' do
    context'ユーザー名が未入力の時' do
      it 'バリデーションに引っかかる' do
        user = build(:user, user_name: '')
        user.valid?
        expect(user.errors.full_messages).to include('ユーザー名が未入力です')
      end
    end
    context'ユーザー名が30字以上の時' do
      it 'バリデーションに引っかかる' do
        user = build(:user, user_name: Faker::String.random(length: 31))
        user.valid?
        expect(user.errors.full_messages).to include('ユーザー名は30文字以内で入力してください')
      end
    end
    context'Eメールが未入力の時' do
      it 'バリデーションに引っかかる' do
        user = build(:user, email: '')
        user.valid?
        expect(user.errors.full_messages).to include('メールアドレスが未入力です')
        # expect(user.errors.full_messages).to include('Eメールが未入力です')
      end
    end
    context'パスワードが未入力の時' do
      it 'バリデーションに引っかかる' do
        user = build(:user, password: '')
        user.valid?
        expect(user.errors.full_messages).to include('パスワードが未入力です')
      end
    end
  end
end
