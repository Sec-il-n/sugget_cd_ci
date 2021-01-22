class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit, update, destroy]
  def create
    #投稿に紐づいたコメントを作成(idをi含んだ形でインスタンスを作成)
    @comment = current_user.comments.build(params_comment)
    @comment.save!
    render 'index'
  # rescue => e
    # puts e.class
    # redirect_to _path, danger: t('.create room faild')
  end
  def edit
  end
  def update
  end
  def destroy
    @comment.destroy!
    render 'index'
    # rescue => e
    #   puts e.class
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

end
