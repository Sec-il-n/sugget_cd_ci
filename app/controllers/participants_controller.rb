class ParticipantsController < ApplicationController
  include SuggestsHelper
  before_action :corp_prop_registerd
  before_action :already_joined, only:[:create]
  def create
    participant = current_user.participants.create!(suggest_id: params[:suggest_id])
    redirect_to participants_path(suggest_id: params[:suggest_id]),method: 'post', notice: t('.send messages')
  rescue => e
    puts e.class
    redirect_to participants_path, danger: t('.error occured')
  end
  def index
    @participants = current_user.participants
  end
  def destroy
      @participant = Participant.find_by(id: params[:id])
      if suggest_user?
        redirect_to participants_path, danger: '提案投稿者は非参加に出来ません'

      else
        @participant.destroy!
        redirect_to participants_path, notice: "#{t('.title name')}:「#{@participant.suggest.title}」#{t('.unjoined')}"
      end
  end
  private
  def already_joined
    @participant = Participant.find_by(suggest_id: params[:suggest_id], user_id: current_user.id)

    redirect_to suggest_path(id: params[:suggest_id]), warning: '既に参加済です' if @participant.present?
  end
  def suggest_user?
    @participant.suggest.user == current_user
  end
end
