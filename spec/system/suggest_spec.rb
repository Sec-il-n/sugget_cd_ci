require 'rails_helper'

RSpec.describe Suggest, type: :system do
  describe '新規提案/プロジェクト管理機能' do
    let!(:user) { create(:user) }
    describe '入力が正しい場合' do
      before do
        login_valid_user
      end
      context '提案の新規作成時' do
        it '確認画面が表示される' do
          visit new_suggest_path

          fill_in "#{I18n.t('.dictionary.words.title')}", with:
          '提案'
          fill_in "#{I18n.t('.dictionary.words.details')}", with:
          '詳細'
          check('タグ_1')
          check('タグ_3')
          click_button("#{I18n.t('.dictionary.words.submit')}")

          url = URI.parse(current_url)
          expect(url).to have_content('/suggests/confirm')
        end
      end
      describe '入力が正しくない場合' do
        it 'バリデーションエラーが表示される' do
          visit new_suggest_path

          fill_in "#{I18n.t('.dictionary.words.title')}", with:
          ''
          fill_in "#{I18n.t('.dictionary.words.details')}", with:
          ''
          click_button("#{I18n.t('.dictionary.words.submit')}")

          expect(page).to have_content('2 件のエラーがあります。')
        end
      end


      context '確認画面遷移後' do
        it '戻るボタンで新規投稿画面に戻る' do
          
        end
        it '登録ボタンで一覧画面に遷移する' do

        end
      end
    end

    describe '一覧表示機能' do
      context 'ログインユーザの場合' do
        it '提案一覧が表示される' do

        end
      end
      describe '検索機能' do
        context 'カテゴリ検索した場合' do
          it '提案一覧が指定したカテゴリに絞り込まれる' do

          end
        end
        context '一覧に表示されたタグをクリックした場合' do
          it '提案一覧が指定したタグに絞り込まれる' do

          end
        end
      end
    end

    describe '詳細表示機能' do
      context '詳細画面を表示した場合' do
        it '提案にコメントを投稿できる' do

        end
      end
    end

  end
end
