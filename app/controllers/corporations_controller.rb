class CorporationsController < ApplicationController
  include UsersHelper
  before_action :set_corporation, only:[:show, :edit, :update, :destroy]
  before_action :create_not_permitted, only:[:new, :create]
  before_action :edit_not_permitted, only:[:edit, :update, :destroy]
  def new
    @corporation = Corporation.new

  end
  def create
    @corporation = Corporation.new(params_corporation)
    if @corporation.save
      flash[:notice] = t('.registerd')
    else
      render 'new'
    end
  end
  def show
    @users = @corporation.users
    # @suggests = @users.map { |user| user. suggests_on_going}
    @user_images = @users.map { |user| user.user_image }
    # 企業の提案中案件
    # @suggests = @users.map { |user| user.suggests }
    # suggests.each do |suggest|
    #   @users_joined = suggest.users
    # end
  end
  def edit

  end
  def update
    # if edit_permitted? &&
      begin
        @corporation.update!(params_corporation)
        redirect_to corporation_path(@corporation), notice: '企業登録を編集しました'
      rescue => e
        puts e.class
        flash.now[:danger] = '編集に失敗しました'
        render 'edit'
      end
    # else
    #   redirect_to suggests_path, warning: '編集権限がありません'
    # end
  end
  def select
    
  end
  def selected
    if params[:later]
      redirect_to root_path
    else
      corp_or_prop
    end
  end
  private
  def set_corporation
    @corporation = Corporation.find_by(id: params[:id])
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
