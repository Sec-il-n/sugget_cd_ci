class CommentsController < ApplicationController
  include SuggestsHelper
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :corp_prop_registerd, only:[:create, :edit, :update]
  before_action :comment_user, only:[:edit, :update]
  def create
    @comment = current_user.comments.build(params_comment)
    if contributor?
      flash.now[:warning] = t('.cannot comment')
      render 'index'
    else
      begin
        render 'index' if @comment.save!
      rescue => e
        puts e.class
        redirect_to suggest_path(@comment.suggest), danger: t('.create comment faild')
      end
    end
  end
  def edit
    @suggest = @comment.suggest
    respond_to do|format|
      format.js { render }
      format.html { render }
    end
    # render 'edit'
  end
  def update
    begin
      render 'update' if @comment.update!(params_comment)
    rescue => e
        puts e.class
        redirect_to suggest_path(@comment.suggest), danger: t('.update comment faild')
    end
  end

  def destroy
    if current_user.admin?
      begin
        @comment.destroy!
      rescue => e
        puts e.class
        redirect_to admin_users_path, danger: t('.delete faild')
      end
      flash[:notice] = t('.deleted')
      render 'index'
    end
  end
  private
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
  def params_comment
    # ↓ :suggest_idが✖︎　
    # params.require(:comment).permit(:text, :suggest_id, :user_id)
    params.require(:comment).permit(:text).merge(suggest_id: params[:suggest_id])
  end
  def contributor?
    suggest = Suggest.find_by(id: params[:suggest_id])
    unless suggest.nil?
      suggest.user.id == current_user.id
    end
  end
  def comment_user
    unless @comment.user_id == current_user.id
      flash.now[:danger] = '作成者以外は編集できません'
      render 'index'
    end
  end
end
