require 'rails_helper'

RSpec.describe Comment, type: :system do
  describe 'コメント機能' do
    context '提案詳細画面を表示した場合' do
      context '提案投稿者でない場合' do
        let!(:user) { create(:user, id: 1) }

        let!(:user_2) { create(:user, id: 2) }
        let!(:suggest) { create(:suggest, user_id: user_2.id) }
        before do
          # user_2 = create(:user, id: 2)
          # create(:suggest, user_id: user_2.id)
          suggest
          login_valid_user
        end
        it '提案にコメントを投稿できる' do
          fill_in_comment

          expect(page).to have_content('aaa')
        end
      end
      context'提案投稿者の場合' do
        let!(:user) { create(:user, id: 1) }
        let!(:suggests) { create_list(:suggest, 30) }
        before do
            login_valid_user
            suggests
        end
        it 'コメント投稿が失敗する' do
          fill_in_comment
          expect(page).to have_content("#{I18n.t('.dictionary.words.cannot comment')}")
        end
      end
    end
  end
end
