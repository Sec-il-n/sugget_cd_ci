module CommentsHelper
  def comment_create_or_edit
    if action_name == 'new' || action_name == 'create'
      suggest_comments_path(@suggest)
    elsif action_name == 'update'
      suggest_comment(@suggest, @comment)
    end
  end
end
