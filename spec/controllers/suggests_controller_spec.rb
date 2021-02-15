require 'rails_helper'
RSpec.describe SuggestsController, type: :controller do
  describe '画像アップロード機能'do
    describe 'POST #create' do
      let!(:user) { create(:user) }
      let!(:suggest) { create(:suggest, user_id: user.id) }
      let!(:image) { fixture_file_upload('866-200x300.jpg', 'image/jpeg', true) }
      let!(:image_invalid) { fixture_file_upload('test.html', 'text/html', false) }
      let!(:suggest_params) { attributes_for(:suggest) }
      before do
        user.confirm
        sign_in(user)
      end
      context 'パラメータ有効な場合' do
        it 'requestが成功する' do
          post :create, params: { suggest: suggest_params,  suggest: { image_attrbutes: [image: image]} }
          expect(response.status).to eq 200#redirect
        end
        # 以下２つcontrollerspec
        it 'createが成功しSuggestに紐づいたImage オブジェクトが保存されている' do
          post :create, params: { suggest: suggest_params,  suggest: { image_attrbutes: [image: image]} }
          suggest.images.each do |image|
            expect(assigns(:suggest)).to eq(suggest)
            expect(assigns(:image)).to eq(image)
            # expect(image).to be eq(true)
            # expect(suggest).to be eq(true)
          end
        end
        # new => 無表記(default)で:showに行く場合など。　独自にredirect_toを指定した場合completeするので200になる(?)
      end
      context 'パラメータ不正な場合' do
        it 'createが失敗する' do
          post :create, params: { suggest: suggest_params,  suggest: { image_attrbutes: [image: image_invalid]} }
          suggest.images.each do |image|
            expect(assigns(:suggest)).to_not eq(suggest)
            expect(assigns(:image)).to_not eq(image)
          end
        end
        it 'テンプレートがレンダリングされる' do
          post :create, params: { suggest: suggest_params,  suggest: { image_attrbutes: [image: image_invalid]} }
          expect(response).to render_template :new
        end
        # エラー起こす→spec?
        # context 'エラー。。。　　' do
        #   subject { -> { post :create, params: { suggest: suggest_params,  suggest: { image_attrbutes: [image: image_invalid]} } } }
        #   it { is_expected.to raise_error ActiveRecord::RecordNotFound }
        # end
      end
    end
  end
end
