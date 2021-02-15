require 'rails_helper'
RSpec.describe CorporationsController, type: :controller do
  describe '画像アップロード機能'do
    describe 'POST #create' do
      let!(:user) { create(:user) }
      # let!(:corporation) { create(:corporation) }
      let!(:image) { fixture_file_upload('866-200x300.jpg', 'image/jpeg', true) }
      let!(:image_invalid) { fixture_file_upload('test.html', 'text/html', false) }
      let!(:corporation) { create(:corporation, image: image ) }
      # let!(:corporation_invlid) { create(:corporation, image: image_invalid ) }
      let!(:params) { attributes_for(corporation) }
      # let!(:invlid_params) { attributes_for(orporation_invlid) }
      before do
        user.confirm
        sign_in(user)
      end
      context 'パラメータ有効な場合' do
        it 'requestが成功する' do
          # post :create, params: { corporation: attributes_for(corporation) }
          post :create, params: { corporation: params }
          expect(response.status).to eq 302#redirect
        end
        # 以下２つcontrollerspec
        it 'createが成功しImage オブジェクトが保存されている' do
          post :create, params: { corporation: attributes_for(corporation) }
          # post :create, params: { corporation:  corporation_params }.merge { corporation: image }
          binding.pry
          expect(assigns(:corporation)).to eq(corporation)
        end
      end
      context 'パラメータ不正な場合' do
        let!(:corporation) { create(:corporation) }
        it 'createが失敗する' do
          post :create, params: { corporation: corporation_params , corporation: image_invalid }
          expect(assigns(:corporation)).to_not eq(corporation)
        end
        it 'テンプレートがレンダリングされる' do
          post :create, params: { corporation: corporation_params , corporation: image_invalid }
          expect(response).to render_template :new
        end
      end
    end
  end
end
