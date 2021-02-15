require 'rails_helper'

RSpec.describe Proprietorship, type: :system do
  describe '企業情報登録(個人)機能' do
    context '登録ユーザーで企業未登録の場合' do
      let!(:user) { create(:user, corporation_id: nil) }
      before do
        login(user)
      end
      it '所属企業(個人)を登録できる' do
        visit 'proprietorships/new'
        fill_in 'proprietorship[name]', with: 'fff.prop'
        fill_in '詳細', with: 'aaabbbbccc'
        select 'その他', from: '業種カテゴリ'
        # controller specへ
        # attach_file('proprietorship_image', './spec/fixtures/866-200x300.jpg', make_visible: true)
        click_on '登録する'
        expect(page).to have_content('企業登録を完了しました')
      end
    end
    context '登録ユーザーで企業登録(個人)が完了している場合' do
      let!(:user) { create(:user, proprietorship_id: 1) }
      before do
        login(user)
      end
      it '所属企業(個人)の登録ができない' do
        visit 'proprietorships/new'
        expect(page).to have_content('企業登録は完了しています')
      end
    end
  end
  describe '企業情報(個人)編集機能'do
    let!(:user) { create(:user, proprietorship_id: 1) }
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
        visit '/proprietorships/2/edit'
        expect(page).to have_content('編集権限がありません')
      end
    end
  end
end
