class MessagesController < ApplicationController
  before_action do
    @room = Room.find(params[:room_id])
  end
  def index
    @messages = @room.messages
    # （最後）のメッセージが存在し、かつユーザIDが自分でない
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end
  def create
    @message = @conversation.messages.build(params_messages)
    redirect_to room_messages_path(@room) if @message.save
  end
  private
  def params_messages
    params.require(:message).permit(:text, :user_id)
  end
end
