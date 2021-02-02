module ControllerMacros
  # def login_admin
  # end
  #
  def login_user
    let!(:user) { build(:user) }
    before do
      sign_in user
    end
  end
  # def login_user
  #   before(:each) do
  #     @request.env['devise.mapping'] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     sigin_in user
  #   end
  # end
end
