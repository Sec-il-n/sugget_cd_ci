class ProprietorshipsController < ApplicationController
  before_action :set_proprietorship, only:[:show, :edit, :update, :destroy]
  def new
    @proprietorship = Proprietorship.new
  end
  def create
    @proprietorship = Proprietorship.new(params_proprietorship)
    if @proprietorship.save
      flash[:notice] = t('.registerd')
    else
      render 'new'
    end
  end
  def show
    @user = @proprietorship.user
  end
  def edit
  end
  private
  def set_proprietorship
    @proprietorship = Proprietorship.find_by(id: params[:id])
  end
  def params_proprietorship
    params.require(:proprietorship).permit(:name, :info, :image, :category_id)
  end
end
