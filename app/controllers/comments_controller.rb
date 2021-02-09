class CommentsController < ApplicationController
  include SuggestsHelper
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :corp_prop_registerd, only:[:create, :edit, :update]
  before_action :comment_user, only:[:edit, :update]
  def create
    #投稿に紐づいたコメントを作成(idをi含んだ形でインスタンスを作成)
    @comment = current_user.comments.build(params_comment)
    if contributor?
      flash.now[:warning] = t('.cannot comment')
      render 'index'
    else
      # @comment = current_user.comments.build(params_comment)
      begin
        @comment.save!
        render 'index'
      rescue => e
        puts e.class
        redirect_to suggest_path(@comment.suggest), danger: t('.create comment faild')
      end
    end
  end
  def edit
    @suggest = @comment.suggest
  end
  def update
    begin
      render 'update' if @comment.update!(params_comment)
      # else
      #   render 'index'
    rescue => e
        puts e.class
        redirect_to suggest_path(@comment.suggest), danger: t('.create comment faild')
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
