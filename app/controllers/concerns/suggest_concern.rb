require 'active_support/concern'

module SuggestConcern
  extend ActiveSupport::Concern

  def set_suggest
    @suggest = Suggest.find_by(id: params[:id])
  end
  def suggest_params
    params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[:image, :image_cache] }).merge(user_id: current_user.id)
  end
  def suggest_update_params
    params.require(:suggest).permit(:title, :details, :category_id, { images_attributes:[:image, :image_cache, :id]}, tag_ids: [].map(&:to_i)).merge(user_id: current_user.id)
  end
  def not_admin
    unless current_user.admin?
      redirect_to root_path, danger: t('dictionary.words.not admin')
    end
  end
end
