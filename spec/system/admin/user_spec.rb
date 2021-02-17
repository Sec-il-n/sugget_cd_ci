require 'rails_helper'

RSpec.describe User, type: :system  do
  describe '管理画面のテスト' do
    context ' ログインユーザが管理者権を持つユーザーの場合'do
      let!(:user) { create(:user, admin: true) }
      before do
        login_valid_user
      end
      it '管理者画面へのリンクが表示される' do
        expect(page).to have_link('管理者画面')
      end
      it 'プロジェクト一覧(管理者画面)へ遷移できる' do
        visit admin_users_path
        url = URI.parse(current_url)
        expect(url).to have_content('/admin/users')
      end
      context 'プロジェクト一覧(管理者画面)へ遷移した場合' do
        before do
          user_2 = create(:user)
          create(:suggest, user_id: user_2.id)
        end
        it '提案の編集ができる' do
          visit admin_users_path
          click_on '編集する'
          fill_in 'suggest[title]', with: '更新'
          click_on '更新する'
        end
        it '提案の削除ができる' do
          visit admin_users_path
          find(:xpath, '/html/body/div[2]/div/div[2]/table/tbody[1]/tr/td[2]/a').click
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content('を削除しました')
        end
      end
      context 'プロジェクト詳細画面へ遷移した場合' do
        let!(:user_2) { create(:user, corporation_id: nil, proprietorship_id: 1) }
        let!(:suggest){ create(:suggest, user_id: user_2.id) }
        let!(:comment) { create(:comment, user_id: user.id, suggest_id: suggest.id) }

        before do
          comment
        end
        it 'コメントの削除ができる' do
          visit suggests_path
          # 詳細へ
          find(:xpath, '/html/body/div[2]/div[2]/div[1]/div[1]/strong/a').click
          first('.comment-destroy').click
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content('コメントを削除しました')
        end
      end
    end
    context ' ログインユーザが管理者権を持たないユーザーの場合'do
      let!(:user) { create(:user) }
      let!(:user_2) { create(:user, corporation_id: nil, proprietorship_id: 1) }
      let!(:suggest){ create(:suggest, user_id: user.id) }
      let!(:comment) { create(:comment, user_id: user_2.id, suggest_id: suggest.id) }
      before do
        login(user)
      end
      it 'プロジェクト一覧(管理者画面)へ遷移できない' do
        visit '/admin/users'
        expect(page).to have_content('管理者権限が必要です')
      end
    end
  end
end
