require 'active_support/concern'

module ProprietorshipConcern
  extend ActiveSupport::Concern

  def set_proprietorship
    @proprietorship = Proprietorship.find_by(id: params[:id])
  end
  def update_user_proprietorship_id
    @user = User.find(current_user.id)
    @user.update!(proprietorship_id: @proprietorship.id)
  end
  def params_proprietorship
    params.require(:proprietorship).permit(:name, :info, :image, :category_id)
  end
  def edit_permitted?
    @proprietorship.id == current_user.proprietorship_id
  end
  def edit_not_permitted
     unless @proprietorship.present? && @proprietorship.id == current_user.proprietorship_id
       redirect_to suggests_path, warning: '編集権限がありません'
     end
  end

end
