require 'rails_helper'

RSpec.describe Corporation, type: :system do
  describe '企業情報登録機能' do
    context '登録ユーザーで企業未登録の場合' do
      let!(:user) { create(:user, corporation_id: nil) }
      before do
        login(user)
      end
      it '企業登録のリンクが表示される'do
        expect(page).to have_link('企業登録')
      end
      it '所属企業を登録できる' do
        visit 'corporations/new'
        fill_in '企業名', with: 'fff.com'
        fill_in '詳細', with: 'aaabbbbccc'
        select '小売業', from: '業種カテゴリ'
        find(:xpath, '/html/body/div[2]/div/form/div[5]/input').click
        # click_on '登録する'
        expect(page).to have_content('企業登録を完了しました')
      end
    end
    context '登録ユーザーで企業登録が完了している場合' do
      let!(:user) { create(:user) }
      before do
        login(user)
      end
      it '所属企業の登録ができない' do
        visit 'corporations/new'
        expect(page).to have_content('企業登録は完了しています')
      end
    end
  end
  describe '企業情報編集機能'do
    let!(:user) { create(:user) }
    before do
      login(user)
    end
    context 'ユーザーの所属する企業の場合' do
      it 'アカウント編集画面からユーザーの所属する企業情報を編集できる'do
        click_link 'アカウント編集'
        expect(page).to have_link('企業登録を編集する')
        click_link '企業登録を編集する'

        fill_in '詳細', with: '詳細更新'
        click_on '更新する'
        expect(page).to have_content('詳細更新')
      end
    end
    context 'ユーザーの所属する企業でない場合' do
      it '企業情報を編集できない'do
        visit '/corporations/2/edit'
        expect(page).to have_content('編集権限がありません')
      end
    end
  end
end
