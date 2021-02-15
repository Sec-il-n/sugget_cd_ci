require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'ログイン/ログアウト機能' do
    let!(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }

    context '有効なログインユーザでログインした場合' do
      it 'プロジェクト一覧画面に遷移する' do
        # UserSpecHelpers
        login_valid_user

        expect(page).to have_content("#{I18n.t('.dictionary.words.index')}")
      end
    end
    context 'ログアウトリンクをクリックしたとき'do
      it 'ログイン画面に遷移する'do
        login_valid_user
        find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[1]/a').click
        url = URI.parse(current_url)
        expect(url).to have_content('/users/sign_in')
      end
    end
  end
  describe 'ユーザー登録機能' do
    context 'ユーザーが企業登録を完了していない場合' do
      let!(:user) { create(:user, corporation_id: nil) }
      # create :user without corp_id, prop_id
      before do
        login_valid_user
        user_2 = create(:user, corporation_id: 1)
        create(:suggest, user_id: user_2.id)
      end
      it '企業登録画面へのリンクが表示される' do
        expect(page).to have_link('企業登録')
      end
      it 'コメント投稿ができない' do
        visit suggests_path
        fill_in_comment
        # urlは取得できない
        # url = get_url
        # expect(url).to have_content('/corporations/select')
        expect(page).to have_content("#{I18n.t('.dictionary.words.register needed')}")
      end
      it '提案の新規投稿ができない' do
        visit new_suggest_path
        expect(page).to have_content("#{I18n.t('.dictionary.words.register needed')}")
      end
      it '提案への参加ができない' do
        visit suggests_path
        first('.title a').click
        click_on("#{I18n.t('.dictionary.words.join')}")
        expect(page).to have_content("#{I18n.t('.dictionary.words.register needed')}")
      end
    end
    context 'ユーザーが企業登録を完了している場合' do
      let!(:user) { create(:user, corporation_id: 1) }
      before do
        login_valid_user
        user_2 = create(:user, corporation_id: 1)
        create(:suggest, user_id: user_2.id)
      end
      it 'コメント投稿ができる' do
        visit suggests_path
        fill_in_comment
        expect(page).to have_content('aaa')
      end
      it '提案の新規投稿ができる' do
        # SuggestSpecHelpers
        confirm_view
        url = URI.parse(current_url)
        expect(url).to have_content('/suggests')
        expect(page).to have_content("#{I18n.t('.dictionary.words.suggest created')}")
      end
      it '提案への参加ができる' do
        join_to_suggest
        expect(page).to have_content("#{I18n.t('.dictionary.words.send messages')}")
      end
      context '提案に参加済の場合' do
        it '参加の取り消しができる' do
          join_to_suggest
          visit participants_path
          click_on "#{I18n.t('.dictionary.words.unjoin')}"
          expect(page).to have_content("#{I18n.t('.dictionary.words.unjoined')}")
        end
      end
    end
  end
end
