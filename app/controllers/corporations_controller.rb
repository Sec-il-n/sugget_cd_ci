class CorporationsController < ApplicationController
  before_action :set_corporation, only:[:show, :edit, :update, :destroy]
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
end
