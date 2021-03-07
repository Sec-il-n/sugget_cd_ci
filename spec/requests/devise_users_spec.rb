# https://qiita.com/zongxiaojie/items/d488edd42ba3864859c7#request-spec%E3%82%92%E6%9B%B8%E3%81%84%E3%81%A6%E3%81%84%E3%81%8F
require 'rails_helper'
RSpec.describe 'UserAuthentications', type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, email: '') }

  describe 'POST #create' do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context 'パラメタ有効' do
      it 'requestが成功する' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302#redirect
      end

      it '認証メールが送信される' do
        post user_registration_path, params: { user: user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end

      it 'createが成功する' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end
      it 'リダイレクトされる' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが不正な場合' do
      it 'requestが成功する' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end
      it '認証メールが送信されない' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 0
      end
      it 'createが失敗する' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end
      it 'errorが表示される' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include('メールアドレスが未入力です')
      end
    end

  end
end
