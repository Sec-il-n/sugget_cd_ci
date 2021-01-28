class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    # カラム追加時　StorongParameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_image, :user_image_cache, :remove_user_image])
  end
  # def after_sign_out_path_for(resource)
  #   new_user_session_path # ログアウト後に遷移するpathを設定
  # end
end
