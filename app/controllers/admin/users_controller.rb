class Admin::UsersController < ApplicationController
  before_action :not_admin

  private
  def not_admin
    flash[:danger] = t('dictionary.words.not admin')
    redirect_to root_path unless current_user.admin?
  end
end
