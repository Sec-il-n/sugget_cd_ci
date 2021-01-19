class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # カラム追加時　StorongParameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_image, :user_image_cache, :remove_user_image])
  end
end
