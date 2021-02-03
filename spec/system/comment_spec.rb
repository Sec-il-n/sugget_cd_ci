require 'rails_helper'

RSpec.describe Comment, type: :system do
  describe 'コメント機能' do
    let!(:user) { create(:user, id: 1) }
    let!(:suggests) { create_list(:suggest, 30) }
    before do
        login_valid_user
        suggests
      end
    context '提案詳細画面を表示した場合' do
      context '提案投稿者でない場合' do
        it '提案にコメントを投稿できる' do

          binding.pry
          first('.title a').click
# find_field('#comment_text')
          expect(page).to has_field?('#comment_text')
        end
      end
    end
  end
end
