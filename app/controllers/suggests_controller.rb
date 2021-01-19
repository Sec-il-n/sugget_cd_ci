class SuggestsController < ApplicationController
  before_action :set_suggest, only:[:show, :edit, :update, :destroy]
  def new
    @suggest = Suggest.new
    @suggest.suggest_tags.build
    2.times{@suggest.images.build}
  end
  def create
    @suggest = Suggest.new(suggest_params)
    # if params[:suggest][:images].present?
    #   suggest_params[:images].each do |image|
    #     @suggest.images.build(suggest_params.clone.merge({images: image}))
        if @suggest.save
          redirect_to suggests_path, notice: t('.suggest.created')
    #     end
    #   end
    # elsif @suggest.save
    # # if @suggest.save
    #   redirect_to suggests_path, notice: t('.suggest.created')
    else
      flash.now[:warning] = t('.suggest.create_faild')
      render 'new'
    end
  end
  def index
    @suggests = Suggest.all
    # binding.pry
    if params[:tag].present?
      @suggests = Tag.find_by(id: params[:tag]).suggests
    elsif params[:category_id].present?
      @suggests = @suggests.category_search(params[:category_id])
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

    # image 複数
    params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[ :image] }).merge(user_id: current_user.id)
    # params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, {images: []}).merge(user_id: current_user.id)

    # 中間モデルの「optional: true」で解決
  end
end
