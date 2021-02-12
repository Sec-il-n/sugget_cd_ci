# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!, only:[:new, :create]
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :html, :json
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # ↓ならrouting -> devise_for: ??
  # def destroy
    # redirect_to new_user_session_path, notice: "ログアウトしました"

  # end

  protected
  def after_sign_out_path_for(resource)
    # root_path
    new_user_session_path# ログアウト後に遷移するpathを設定
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
