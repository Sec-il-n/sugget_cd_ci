class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only:[:new, :create]
  respond_to :html, :json

  def update
    super
  end
  protected
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def after_sign_up_path_for(resource)
    select_corporations_path(resource)
  end

end
