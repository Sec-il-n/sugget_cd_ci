require 'rails_helper'
RSpec.describe ProprietorshipsController, type: :controller do
  describe '画像アップロード機能'do
    describe 'POST #create' do
      let!(:user) { create(:user, corporation_id: nil) }
      let!(:image) { fixture_file_upload('866-200x300.jpg', 'image/jpeg', true) }

      let!(:proprietorship) { create(:proprietorship, image: image) }

      let!(:params) { attributes_for(:proprietorship) }
      before(:each) do
        user.confirm
        sign_in(user)
      end
      context 'パラメータ有効な場合' do
        it 'requestが成功する' do
          post :create, params: { proprietorship: params, proprietorship: { image: image } }
          expect(response.status).to eq 200#redirect
        end
        it 'createが成功しImage オブジェクトが保存されている' do
          post :create, params: { proprietorship: params, proprietorship: { image: image } }
          expect(proprietorship).to be_image
        end
      end
      context 'パラメータ不正な場合' do
        let!(:image_invalid) { fixture_file_upload('test.html', 'text/html', false) }
        let!(:params) { attributes_for(:proprietorship) }
        it 'createが失敗する' do
          post :create, params: { proprietorship: params , proprietorship: { image: image_invalid } }
          expect(assigns(:proprietorship)).to_not eq(proprietorship)#proprietorshipには正規のパラメタ(describe下のlet!)が入っている。このテストケースでは:proprietorshipには保存されないので検証が成功する。
        end
        it 'テンプレートがレンダリングされる' do
          post :create, params: { proprietorship: params , proprietorship: { image: image_invalid } }
          expect(response).to render_template :new
        end
      end
    end
  end
end
