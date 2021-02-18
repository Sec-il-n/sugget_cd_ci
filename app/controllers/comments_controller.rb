class CommentsController < ApplicationController
  include SuggestsHelper
  include CommentConcern
  before_action :set_comment, only: [:update, :destroy, :ajax_edit]
  before_action :corp_prop_registerd, only:[:create, :ajax_edit, :update]
  before_action :comment_user, only:[:ajax_edit, :update]
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
  def update
    begin
      flash.now[:notice] = 'コメントを編集しました'
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
        redirect_to admin_users_path, alart: t('.delete faild')
      end
      flash[:notice] = t('.deleted')
      render 'index'
    end
  end
  def ajax_edit
    respond_to do|format|
      format.js { @comment }
    end
  end
end
