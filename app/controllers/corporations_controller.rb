class CorporationsController < ApplicationController
  before_action :set_corporation, only:[:show, :edit, :update, :destroy]
  def show

  end
  private
  def set_corporation
    @corporation = Corporation.find_by(id: params[:id])
  end
end
