require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'お問い合わせ機能' do
    let!(:user) { create(:user) }
    let!(:contact) { create(:contact, user_id: user.id) }
    context'お問い合わせ内容が未入力の時' do
      it 'バリデーションに引っかかる' do
        # build->createだとその時点でdbのバリデーションに引っかかってエラーになる
        contact = build(:contact, content: '')
        contact.valid?
        expect(contact.errors.full_messages).to include('お問い合わせ内容を入力してください')
      end
    end
    context'お問い合わせ内容が600字以上の時' do
      it 'バリデーションに引っかかる' do
        contact = build(:contact, content: Faker::String.random(length: 601))
        contact.valid?
        expect(contact.errors.full_messages).to include('お問い合わせ内容は600文字以内で入力してください')
      end
    end
  end
end
