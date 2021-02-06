class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :room_alredy_created, only:[:create]
  # ここを「参加済み一覧に持ってきたい」　？？tops不要？
  # def top
  #   # if @user.id == params[:user_id] && user_signed_in?
  #   if user_signed_in?
  #     @suggest = Suggest.find_by(id: params[:suggest_id])
  #     @user = current_user
  #     @room = Room.new
  #   end
  # end
  # 取得不可
  def index

    # @rooms = current_user.rooms
    @rooms = current_user.participants.map { |participant| participant.suggest.room }
  end
  def create

    @room = Room.new(suggest_id: params[:suggest_id])
    @room.save!
    redirect_to room_path(id: @room.id), notice: t('.room created')
  rescue => e
    puts e.class
    redirect_to participants_path, danger: t('.create room faild')
    # if Room.between(params[:sender_id],params[:recipient_id]).present?
    #   @room = Room.between(params[:sender_id],params[:recipient_id]).first
    # else
    #   @room = Room.create!(params_room)
    # end
    # redirect_to room_messages_path(@room)
  end
  def show
    @room = Room.find_by(id: params[:id])
    @messages = @room.messages
    @suggest = @room.suggest
    # @message = @room.messages.build ??
  end
  private
  def room_alredy_created
    @rooms = Room.where(suggest_id: params[:suggest_id])
    redirect_to participants_path if @rooms.present?
  end
  # def params_room
  #   params.require(:room).permit(:suggest_id, :sender_id, :recipient_id).merge(user_id: urrent_user.id)
  # end

  # def between
  #   Room.where(sender_id: params[:sender_id], recipient_id: params[:recipient_id]) or
  #   Room.where(sender_id: params[:recipient_id], recipient_id: params[:sender_id])
  # end
end
