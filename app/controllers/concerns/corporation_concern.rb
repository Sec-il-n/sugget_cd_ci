require 'active_support/concern'

module CorporationConcern
  extend ActiveSupport::Concern

  def set_corporation
    @corporation = Corporation.find_by(id: params[:id])
  end
  def update_user_corporation_id
    @user = User.find(current_user.id)
    @user.update!(corporation_id: @corporation.id)
  end
  def params_corporation
    params.require(:corporation).permit(:figure, :name, :info, :image, :category_id)
  end
  def corp_or_prop
    if params[:figure] == 'corporation'
      redirect_to new_corporation_path
    elsif params[:figure] == 'proprietorship'
      redirect_to new_proprietorship_path
    end
  end
  def edit_permitted?
    @corporation.id == current_user.corporation_id
  end
  def edit_not_permitted
    # unlessと条件の順番　@proprietorshipがnilの場合.idでerrorになるので、一つ目の条件で評価しないようにする
     unless @corporation.present? && @corporation.id == current_user.corporation_id
       redirect_to suggests_path, warning: '編集権限がありません'
     end
  end

end
