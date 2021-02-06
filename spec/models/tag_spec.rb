require 'rails_helper'
RSpec.describe Tag, type: :model do
  describe 'タグ機能' do
    context'タグ名が未入力の時' do
      it 'バリデーションに引っかかる' do
        tag = build(:tag, name: '')
        tag.valid?
        expect(tag.errors.full_messages).to include('タグ名を入力してください')
      end
    end
    context'タグ名が20字以上の時' do
      it 'バリデーションに引っかかる' do
        tag = build(:tag, name: Faker::String.random(length: 23))
        tag.valid?
        expect(tag.errors.full_messages).to include('タグ名は20文字以内で入力してください')
      end
    end
  end
end
