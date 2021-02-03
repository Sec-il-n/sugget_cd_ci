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
      # 以下suggest/:id/editなので No Route Maches -> sugget_specへ
      context 'プロジェクト一覧(管理者画面)へ遷移後' do
        before do
          user_2 = create(:user)
          create(:suggest, user_id: user_2.id)
        end
        it '提案の編集ができる' do
          visit admin_users_path
          click_on '編集する'
          fill_in 'suggest[title]', with: '更新'
          binding.pry
          click_on '更新する'
        end
        it '提案の削除ができる' do

        end
      end
    end
    context ' ログインユーザが管理者権を持たないユーザーの場合'do
      it '提案の編集が失敗する' do

      end
      it '提案の削除が失敗する' do

      end
    end
  end
end
