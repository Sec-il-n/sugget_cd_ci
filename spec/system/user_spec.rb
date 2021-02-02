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
  end
end
