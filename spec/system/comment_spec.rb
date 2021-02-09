require 'rails_helper'

RSpec.describe Comment, type: :system do
  describe 'コメント機能' do
    describe 'コメント投稿機能' do
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
    describe 'コメント編集機能' do
      context '提案詳細画面を表示した場合' do
        let!(:user) { create(:user) }
        let!(:user_2) { create(:user, corporation_id: nil, proprietorship_id: 1) }
        let!(:suggest){ create(:suggest, user_id: user_2.id) }
        let!(:comment) { create(:comment, user_id: user.id, suggest_id: suggest.id) }

        context 'コメント投稿者の場合' do
          before do
            login(user)
            comment
          end
          xit '編集リンクからコメントの編集ができる' do
            first(:xpath, '/html/body/div[2]/div[3]/div[1]/div[1]/strong/a').click
            # ↓のリンク１クリックでは編集フォームが表示されない
            first(:xpath, '/html/body/div[2]/div/div/div[2]/div[1]/div[1]/div/div[1]/div/div/a').double_click
            # wait_until { page.has_field('#edit_text_box') }
            find(:xpath,'//*[@id="edit_text_box"]').fill_in with: 'abc'

            # 画面スクロール
            # page.execute_script("window.scrollBy(0, 1000);")
            page.execute_script("$('#edit-area form').submit()")
            # click_on('登録する')
            # find(:xpath, '//*[@id="comment_submit"]/input').click
            expect(page).to have_content('abc')
          end
        end
        context 'コメント投稿者でない場合' do
          before do
            login(user_2)
            comment
          end
          it 'コメントの編集ができない' do
            find(:xpath, '/html/body/div[2]/div[3]/div[1]/div[1]/strong/a').click
            expect(page).not_to have_link('編集する')
          end
        end
      end
    end
  end
end
