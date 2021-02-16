class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_image, :user_image_cache, :remove_user_image])
  end
  def after_sign_in_path_for(resource_or_scope)
    suggests_path
  end
  def after_inactive_sign_up_path_for
    choose_corp_or_prop_path
  end
end
