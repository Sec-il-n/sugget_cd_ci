require 'active_support/concern'

module RoomConcern
  extend ActiveSupport::Concern

  def room_alredy_created
    @rooms = Room.where(suggest_id: params[:suggest_id])
    redirect_to participants_path if @rooms.present?
  end

end
