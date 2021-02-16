require 'active_support/concern'

module CommentConcern
  extend ActiveSupport::Concern

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
  def params_comment
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
