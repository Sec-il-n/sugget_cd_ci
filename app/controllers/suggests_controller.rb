class SuggestsController < ApplicationController
  include SuggestsHelper
  before_action :set_suggest, only:[:show, :edit, :update, :destroy]
  before_action :not_admin, only:[:edit, :update, :destroy]
  before_action :corp_prop_registerd, only:[:new, :create]
  def new
    @suggest = Suggest.new
    @suggest.suggest_tags.build
    2.times{@suggest.images.build}
  end
  def create
    @suggest = Suggest.new(suggest_params)
    # 要↓
    @suggest.suggest_tags.build
    2.times{@suggest.images.build}
    if params[:back]
      # ここでタグチェック外れる
      render 'new'
    # if params[:suggest][:images].present?
    #   suggest_params[:images].each do |image|
    #     @suggest.images.build(suggest_params.clone.merge({images: image}))
    else
      if @suggest.save
          Participant.create(suggest_id: @suggest.id, user_id: current_user.id)
          redirect_to suggests_path,
          notice: t('.suggest.created')
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
  end
  def confirm
    @suggest = Suggest.new(suggest_params)
    @images = @suggest.images.collect(&:image)
    @tags = @suggest.tags.collect(&:name)

    if @suggest.invalid?
      @suggest.suggest_tags.build
      2.times{@suggest.images.build}
      render 'new'

    elsif @suggest.valid?
      @suggest.suggest_tags.build
      2.times{@suggest.images.build}
      flash.now[:notice] = t('.confirmation')
      render 'confirm'

    end
    # if @suggest.valid?
    #   flash.now[:notice] = t('.confirmation')
    #   render 'confirm'
    # else
    #   @suggest.suggest_tags.build
    #   2.times{@suggest.images.build}
    #   render 'new'
    # end
  end
  def index
    @suggests = Suggest.all.page(params[:page]).per(5)
    # binding.pry
    if params[:tag].present?
      @suggests = Tag.find_by(id: params[:tag]).suggests.all.page(params[:page]).per(5)
    elsif params[:category_id].present?
      @suggests = @suggests.category_search(params[:category_id])
    end
  end
  def show
    @comment = Comment.new
    # undefined method `comments' for nil:NilClass
    @comments = @suggest.comments.recent
  end
  def edit
    # collection + collection_check_boxesが新規[POST]と混ざってerrorになるのでタグの更新は行わない
    # @suggest.suggest_tags.build

    # 現在の最低2+1⬇︎
    @suggest.images.build

  end
  def update
    if current_user.admin? &&
    begin @suggest.update!(suggest_update_params)
      redirect_to admin_users_path, notice: t('.updated')
    rescue => e
      puts e.class
      redirect_to admin_users_path, notice: '更新に失敗しました'
    end
    else
      redirect_to suggests_path, danger: t('.need admin')
    end
  end
  def destroy
    # if current_user.admin?
      begin
        @suggest.destroy!
        redirect_to admin_users_path, notice: "#{@suggest.title}#{t('.destroyed')}"
      rescue => e
        puts e.class
        redirect_to admin_users_path, danger: t('.destroy faild')
      end
    # else
    #   redirect_to suggests_path, danger: t('.need admin')
    # end
  end

  private
  def set_suggest
    @suggest = Suggest.find_by(id: params[:id])
  end
  def suggest_params
    # EROR:Unpermitted parameter: :tag_ids
    # params.require(:suggest).permit(:title, :details).merge(tag_ids: params[:suggest][:tag_ids])
    # ERROR:attributes.suggest.required

    # Unpermitted parameter: :image_cache
    params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[:image, :image_cache] }).merge(user_id: current_user.id)
    # params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, { images_attributes:[ :image] }).merge(user_id: current_user.id)

    # params.require(:suggest).permit(:title, :details, :category_id, { tag_ids: [] }, {images: []}).merge(user_id: current_user.id)
  end
  def suggest_update_params
    params.require(:suggest).permit(:title, :details, :category_id, { images_attributes:[:image, :image_cache, :id]}, tag_ids: [].map(&:to_i)).merge(user_id: current_user.id)
    # params.require(:suggest).permit(:title, :details, :category_id, { images_attributes:[:image, :image_cache, :id]}, tag_ids: [].map(&:to_i)).merge(user_id: current_user.id, suggest:[images_attributes:[:image, :image_cache, :id]],suggest:[tag_ids: [].map(&:to_i)] )
    # params.require(:suggest).permit(:title, :details, :category_id).merge(user_id: current_user.id, suggest:[images_attributes:[:image, :image_cache, :id]],suggest:[tag_ids: [].map(&:to_i)] )
    # params.require(:suggest).permit(:title, :details, :category_id, { images_attributes:[:image, :image_cache, :id]}, tag_ids: [].map(&:to_i)).merge(user_id: current_user.id)
  end
  def not_admin
    unless current_user.admin?
      redirect_to root_path, danger: t('dictionary.words.not admin')
    end
  end
end
