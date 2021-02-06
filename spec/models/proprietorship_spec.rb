require 'rails_helper'

RSpec.describe Proprietorship, type: :model do
  describe '企業(個人)登録機能' do
    context'企業名が未入力の時' do
      it 'バリデーションに引っかかる' do
        proprietorship = build(:proprietorship, name: '')
        proprietorship.valid?
        expect(proprietorship.errors.full_messages).to include('企業(個人)名を入力してください')
      end
    end
    context'詳細が未入力の時' do
      it 'バリデーションに引っかかる' do
        proprietorship = build(:proprietorship, info: '')
        proprietorship.valid?
        expect(proprietorship.errors.full_messages).to include('詳細を入力してください')
      end
    end
    context'カテゴリーが未選択の時' do
      it 'バリデーションに引っかかる' do
        proprietorship = build(:proprietorship, category_id: nil)
        proprietorship.valid?
        expect(proprietorship.errors.full_messages).to include('Categoryを入力してください')
      end
    end
    context'企業名が20字以上の時' do
      it 'バリデーションに引っかかる' do
        proprietorship = build(:proprietorship, name: Faker::String.random(length: 601))
        proprietorship.valid?
        expect(proprietorship.errors.full_messages).to include('企業(個人)名は20文字以内で入力してください')
      end
    end
    context'詳細が2000字以上の時' do
      it 'バリデーションに引っかかる' do
        proprietorship = build(:proprietorship, info: Faker::String.random(length: 2001))
        proprietorship.valid?
        expect(proprietorship.errors.full_messages).to include('詳細は2000文字以内で入力してください')
      end
    end
  end
end
