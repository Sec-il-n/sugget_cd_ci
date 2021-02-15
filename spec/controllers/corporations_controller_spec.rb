require 'rails_helper'
RSpec.describe CorporationsController, type: :controller do
  describe '画像アップロード機能'do
    describe 'POST #create' do
      let!(:user) { create(:user, corporation_id: nil) }
      let!(:image) { fixture_file_upload('866-200x300.jpg', 'image/jpeg', true) }
      let!(:image_invalid) { fixture_file_upload('test.html', 'text/html', false) }

      let!(:corporation) { create(:corporation, image: image) }

      let!(:params) { attributes_for(:corporation) }
      before(:each) do
        user.confirm
        sign_in(user)
      end
      context 'パラメータ有効な場合' do
        it 'requestが成功する' do
          post :create, params: { corporation: params, corporation: { image: image } }
          expect(response.status).to eq 200#redirect
        end
        it 'createが成功しImage オブジェクトが保存されている' do
          post :create, params: { corporation: params, corporation: { image: image } }
          # expect(assigns(:corporation)).to eq(corporation)#corporation ==nil
          expect(corporation).to be_image
        end
      end
      context 'パラメータ不正な場合' do
        it 'createが失敗する' do
          post :create, params: { corporation: params , corporation: { image: image_invalid } }
          # x　expect(corporation).to_not be_image #got true
          expect(assigns(:corporation)).to_not eq(corporation)
        end
        it 'テンプレートがレンダリングされる' do
          post :create, params: { corporation: params , corporation: { image: image_invalid } }
          expect(response).to render_template :new
        end
      end
    end
  end
end
