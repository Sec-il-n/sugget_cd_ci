class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :room_alredy_created, only:[:create]
  def index

    @rooms = current_user.participants.map { |participant| participant.suggest.room }
    if @rooms.nil?
      redirect_to participants_path, notice: '参加済み提案でチャットルーム開設をしてメンバーとやりとりができます'
    end
  end
  def create

    @room = Room.new(suggest_id: params[:suggest_id])
    @room.save!
    redirect_to room_path(id: @room.id), notice: t('.room created')
  rescue => e
    puts e.class
    redirect_to participants_path, danger: t('.create room faild')
  end
  def show
    @room = Room.find_by(id: params[:id])
    @messages = @room.messages
    @suggest = @room.suggest
  end
  private
  def room_alredy_created
    @rooms = Room.where(suggest_id: params[:suggest_id])
    redirect_to participants_path if @rooms.present?
  end
end
