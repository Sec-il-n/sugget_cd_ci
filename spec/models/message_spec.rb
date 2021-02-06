require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ機能' do
    let!(:user) { create(:user) }
    let!(:suggest) { create(:suggest, user_id: user.id) }
    let!(:room) { create(:room, suggest_id: suggest.id) }
    let!(:message) { create(:message, user_id: user.id, room_id: room.id) }
    context'メッセージ内容が未入力の時' do
      it 'バリデーションに引っかかる' do
        message = build(:message, text: '')
        message.valid?
        expect(message.errors.full_messages).to include('メッセージを入力してください')
      end
    end
    context'メッセージが100字以上の時' do
      it 'バリデーションに引っかかる' do
        message = build(:message,user_id: user.id, room_id: room.id, text: Faker::String.random(length: 101))
        message.valid?
        expect(message.errors.full_messages).to include('メッセージは100文字以内で入力してください')
      end
    end
  end
end
