class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only:[:new, :create]
  respond_to :html, :json

  protected
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
