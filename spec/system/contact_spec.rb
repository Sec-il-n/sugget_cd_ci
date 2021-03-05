require 'rails_helper'

RSpec.describe Contact, type: :system, js: true do
# RSpec.describe Contact, type: :system do
  describe 'お問い合わせ機能' do

    context'お問い合わせ画面に遷移した場合'do
      context'フォーム入力が正しい場合'do
        let!(:user) { create(:user) }
        before do
          login(user)
        end
        it'問い合わせ内容を投稿できる'do
          visit new_contact_path

          find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[3]/a').click
          find(:xpath, '//*[@id="contact_content"]').fill_in with: 'something you whant to ask'
          find(:xpath, '/html/body/div[2]/div/form/div[2]/input').click

          expect(page).to have_content('お問い合わせを受け付けました')
        end
      end
      context'フォーム入力に誤りがある場合'do
        let!(:user) { create(:user) }
        before do
          login(user)
        end
        it'バリデーションエラーが表示される'do
        visit new_contact_path

        find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[3]/a').click

        invalid_texts = Faker::Base.regexify("[aあ]{601}")
        find(:xpath, '//*[@id="contact_content"]').fill_in with: invalid_texts
        find(:xpath, '/html/body/div[2]/div/form/div[2]/input').click

        expect(page).to have_content('お問い合わせの送信に失敗しました')
        expect(page).to have_content('お問い合わせ内容は600文字以内で入力してください')
        end
      end
    end

  end
end
