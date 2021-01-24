class Admin::UsersController < ApplicationController
  before_action :not_admin
  # headerに管理者画面
  def index
    @suggests = Suggest.all
  end
  # def show　<-元のものを使用
  #   @suggest = Suggest.find_by(id: params[:id])
  #   @comments = @suggest.comments
  # end
  # def destroy　<-CommentsController
  #   @comment = Comment.find_by(id: params[:id])
  #
  # end
  private
  def not_admin
    unless current_user.admin?
      redirect_to root_path, danger: t('dictionary.words.not admin')
    end
  end
end
