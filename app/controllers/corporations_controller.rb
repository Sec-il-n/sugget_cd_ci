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

  end
  def edit
  end
  def select

  end
  def selected
    corp_or_prop
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
