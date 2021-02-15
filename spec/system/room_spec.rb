require 'rails_helper'

RSpec.describe Room, type: :system do
  # 提案投稿時投稿者を参加済にする　◯
  # Participantの重複制御　◯
  describe 'チャット機能' do
    let!(:user) { create(:user) }
    let!(:suggest){ create(:suggest, user_id: user.id) }
    let!(:participant) { create(:participant, suggest_id: suggest.id, user_id: user.id) }
    context '提案に参加済のユーザーの場合' do
      before do
        login(user)
        participant
      end
      it 'チャットルームを作成できる' do
        visit participants_path
        expect(page).to have_link('チャットルーム開設')
        click_on 'チャットルーム開設'
        expect(page).to have_content('チャットルームを作成しました。提案者とチャットを開始できます。')
        expect(page).to have_content(suggest.title)
      end
      context 'チャットルームでメッセージを入力しenterを押した場合' do
        it 'メッセージが表示される' do
          send_message
          expect(page).to have_content('abce')
        end
      end
    end
  end
end
