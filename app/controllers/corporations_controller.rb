class CorporationsController < ApplicationController
  include UsersHelper
  include CorporationConcern
  before_action :set_corporation, only:[:show, :edit, :update, :destroy]
  before_action :create_not_permitted, only:[:new, :create]
  before_action :edit_not_permitted, only:[:edit, :update, :destroy]
  def new
    @corporation = Corporation.new

  end
  def create
    @corporation = Corporation.new(params_corporation)
    if @corporation && @corporation.save
      update_user_corporation_id
      redirect_to corporation_path(@corporation.id), notice: t('.registerd')
    poration_path(@corporation.id), notice: t('.registerd')
    else
      flash.now[:danger] = '企業登録が失敗しました'
      render 'new'
    end
  end
  def show
    @users = @corporation.users
    @user_images = @users.map { |user| user.user_image }
  end
  def edit

  end
  def update
    begin
      @corporation.update!(params_corporation)
      redirect_to corporation_path(@corporation), notice: '企業登録を編集しました'
    rescue => e
      puts e.class
      flash.now[:danger] = '編集に失敗しました'
      render 'edit'
    end
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
end
