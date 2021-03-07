require 'rails_helper'

RSpec.describe Corporation, type: :model do
  describe '企業登録機能' do
    context'企業名が未入力の時' do
      it 'バリデーションに引っかかる' do
        corporation = build(:corporation, name: '')
        corporation.valid?
        expect(corporation.errors.full_messages).to include('企業名を入力してください')
      end
    end
    context'詳細が未入力の時' do
      it 'バリデーションに引っかかる' do
        corporation = build(:corporation, info: '')
        corporation.valid?
        expect(corporation.errors.full_messages).to include('詳細を入力してください')
      end
    end
    context'カテゴリーが未選択の時' do
      it 'バリデーションに引っかかる' do
        corporation = build(:corporation, category_id: nil)
        corporation.valid?
        expect(corporation.errors.full_messages).to include('Categoryを入力してください')
      end
    end
    context'企業名が20字以上の時' do
      it 'バリデーションに引っかかる' do
        corporation = build(:corporation, name: Faker::String.random(length: 601))
        corporation.valid?
        expect(corporation.errors.full_messages).to include('企業名は20文字以内で入力してください')
      end
    end
    context'詳細が2000字以上の時' do
      it 'バリデーションに引っかかる' do
        corporation = build(:corporation, info: Faker::String.random(length: 2001))
        corporation.valid?
        expect(corporation.errors.full_messages).to include('詳細は2000文字以内で入力してください')
      end
    end
  end
end
