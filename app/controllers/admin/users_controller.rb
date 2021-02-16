class Admin::UsersController < ApplicationController
  before_action :not_admin
  def index
    @suggests = Suggest.all
    if params[:category_id].present?
      @suggests = @suggests.category_search(params[:category_id])
    end
  end
  private
  def not_admin
    unless current_user.admin?
      redirect_to root_path, danger: t('dictionary.words.not admin')
    end
  end
end
