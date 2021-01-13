class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all
  end

  def create
    if Room.between(params[:sender_id],params[:recipient_id]).present?
      @room = Room.between(params[:sender_id],params[:recipient_id]).first
    else
      @room = Room.create!(params_room)
    end
    redirect_to room_messages_path(@room)
  end

  private
  def params_room
    params.permit(:sender_id, :recipient_id)
  end
  # def between
  #   Room.where(sender_id: params[:sender_id], recipient_id: params[:recipient_id]) or
  #   Room.where(sender_id: params[:recipient_id], recipient_id: params[:sender_id])
  # end
end
