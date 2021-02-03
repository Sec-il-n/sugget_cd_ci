class ProprietorshipsController < ApplicationController
  include UsersHelper
  before_action :set_proprietorship, only:[:show, :edit, :update, :destroy]
  before_action :create_not_permitted, only:[:new, :create]
  before_action :edit_not_permitted, only:[:edit, :update, :destroy]
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
  def update
      begin
         @proprietorship.update!(params_proprietorship)
         redirect_to proprietorship_path(@proprietorship), notice: '企業登録(個人)を編集しました'
      rescue => e
        puts e.class
        flash.now[:danger] = '編集に失敗しました'
        render 'edit'
      end
  end
  private
  def set_proprietorship
    @proprietorship = Proprietorship.find_by(id: params[:id])
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
