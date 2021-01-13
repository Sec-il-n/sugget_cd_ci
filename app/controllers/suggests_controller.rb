class SuggestsController < ApplicationController
  before_action :set_suggest, only:[:show, :edit, :update, :destroy]
  def new
    @suggest = Suggest.new
    @suggest.suggest_tags.build
  end
  def create
    @suggest = Suggest.new(suggest_params)
    if @suggest.save
      redirect_to suggests_path, notice: t('.suggest.created')
    else
      flash.now[:warning] = t('.suggest.create_faild')
      render 'new'
    end
  end
  def index
    @suggests = Suggest.all
    if params[:tag].present?
        @suggests = Tag.find_by(id: params[:tag]).suggests
    end
  end
  def show

  end
  private
  def set_suggest
    @suggest = Suggest.find_by(id: params[:id])
  end
  def suggest_params
    # EROR:Unpermitted parameter: :tag_ids
    # params.require(:suggest).permit(:title, :details).merge(tag_ids: params[:suggest][:tag_ids])
    # ERROR:attributes.suggest.required
    params.require(:suggest).permit(:title, :details, { tag_ids: [] }).merge(user_id: current_user.id)

    # 中間モデルの「optional: true」で解決
  end
end
