class ProprietorshipsController < ApplicationController
  before_action :set_proprietorship, only:[:show, :edit, :update, :destroy]
  def show
  end
  private
  def set_proprietorship
    @proprietorship = Proprietorship.find_by(id: params[:id])
  end
end
