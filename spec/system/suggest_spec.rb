require 'rails_helper'

RSpec.describe Suggest, type: :system do
  describe '新規提案/プロジェクト管理機能' do
    let!(:user) { create(:user) }
    describe '入力が正しい場合' do
      before do
        login_valid_user
      end
      context '提案の新規作成時' do
        it '新規提案の投稿ができる' do
          confirm_view
          expect(page).to have_content("#{I18n.t('.dictionary.words.suggest created')}")
        end
        it '画像のアップロードができる' do
          upload_image
          have_content("#{I18n.t('.dictionary.words.suggest created')}")
        end
        xit '確認画面が表示される' do
          # SuggestSpecHelpers
          confirm_view

          url = URI.parse(current_url)
          expect(url).to have_content('/suggests/confirm')
        end

        context '確認画面遷移後' do
          xit '戻るボタンで新規投稿画面に戻る' do
            confirm_view
            click_on("#{I18n.t('.dictionary.words.back')}")
            expect(page).to have_content("#{I18n.t('.dictionary.words.new suggest')}")
          end
          context '登録ボタンをクリックした場合' do
            xit '登録が完了し一覧画面に遷移する' do
              create_new_suggest

              url = URI.parse(current_url)
              expect(url).to have_content('/suggests')
              expect(page).to have_content("#{I18n.t('.dictionary.words.suggest created')}")
            end
          end
        end
      end
    end
    # describe '入力が正しくない場合' do
    #   before do
    #     login_valid_user
    #   end
    #   it 'バリデーションエラーが表示される' do
    #     visit new_suggest_path
    #
    #     fill_in "#{I18n.t('.dictionary.words.title')}", with:
    #     ''
    #     fill_in "#{I18n.t('.dictionary.words.details')}", with:
    #     ''
    #     click_button("#{I18n.t('.dictionary.words.submit')}")
    #
    #     expect(page).to have_content('2 件のエラーがあります。')
    #   end
    # end
    #
    # describe '一覧表示機能' do
    #   before do
    #     login_valid_user
    #   end
    #   context 'ログインユーザの場合' do
    #     it '提案一覧が表示される' do
    #       expect(page).to have_content('プロジェクト一覧')
    #     end
    #   end
    #   describe '検索機能' do
    #     let!(:elements) { all('#category') }
    #     before do
    #       create(:user, id: 1)#.suggest作成の場合id指定
    #     end
    #     context 'カテゴリ検索した場合' do
    #       it '提案一覧が指定したカテゴリに絞り込まれる' do
    #         create_list(:suggest, 30)
    #
    #         select ("#{I18n.t('.dictionary.words.category_id_2')}"), from: 'category_id'
    #         click_on ("#{I18n.t('.dictionary.words.search')}")
    #
    #         elements.each do |element|
    #           expect(element.text).to have_content("#{I18n.t('.dictionary.words.category_id_2')}")
    #         end
    #       end
    #     end
    #     context '一覧に表示されたタグをクリックした場合' do
    #       let!(:tags) { all('#tags') }
    #       before do
    #         20.times  do
    #           create(:suggest, :suggest_with_tags)
    #         end
    #       end
    #       it '提案一覧が指定したタグに絞り込まれる' do
    #         # タグ１種類1or2から2に絞り込み
    #         visit suggests_path
    #         tag_name = first('#tags a').text
    #         first('#tags a').click
    #
    #         tags.each do |tag|
    #           expect(tag.text).to eq(tag_name)
    #         end
    #       end
    #     end
    #
    #   end
    # end
    # describe '投稿編集機能' do
    #   context 'ログインユーザーが管理者権限を有する場合' do
    #     let!(:user) { create(:user, admin: true) }
    #     before do
    #       login_valid_user
    #       user_2 = create(:user)
    #       create(:suggest, user_id: user_2.id)
    #     end
    #     it '投稿を編集できる' do
    #       visit admin_users_path
    #       click_on("#{I18n.t('.dictionary.words.edit')}")
    #       fill_in 'suggest[title]', with: '更新'
    #       click_on("#{I18n.t('.dictionary.words.to update')}")
    #       expect(page).to have_content("#{I18n.t('.dictionary.words.updated')}")
    #     end
    #   end
    #   context 'ログインユーザーが管理者権限を持たない場合' do
    #     let!(:user) { create(:user, admin: false) }
    #     before do
    #       login_valid_user
    #     end
    #     it '投稿の更新が失敗する' do
    #       user_2 = create(:user)
    #       suggest = create(:suggest, user_id: user_2.id)
    #       visit edit_suggest_path(suggest.id)
    #       expect(page).to have_content("#{I18n.t('.dictionary.words.not admin')}")
    #     end
    #   end
    # end
    # describe '投稿削除機能' do
    #   context 'ログインユーザーが管理者権限を有する場合' do
    #     let!(:user) { create(:user, admin: true) }
    #     before do
    #       login_valid_user
    #       user_2 = create(:user)
    #       create(:suggest, user_id: user_2.id)
    #     end
    #     it '投稿を削除できる' do
    #       visit admin_users_path
    #       click_on("#{I18n.t('.dictionary.words.destroy')}")
    #       # accept_confirmでOKクリック
    #       expect(page.accept_confirm).to eq "#{I18n.t('.dictionary.words.are you sure')}"
    #       expect(page).to have_content("#{I18n.t('.dictionary.words.destroyed')}")
    #     end
    #   end
    #   # adminで管理画面に行けないテスト済 visitでid指定して遷移できないテストが必要？？
    #   context 'ログインユーザーが管理者権限を持たない場合' do
    #     let!(:user) { create(:user, admin: false) }
    #     before do
    #       login_valid_user
    #     end
    #     xit '投稿の削除が失敗する' do
    #       # user_2 = create(:user)
    #       # suggest = create(:suggest, user_id: user_2.id)
    #       # binding.pry
    #       # expect(page).to have_content("#{I18n.t('.dictionary.words.not admin')}")
    #     end
    #   end
    # end
  end
end
