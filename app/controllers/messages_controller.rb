class MessagesController < ApplicationController
  include MessageConcern
  before_action do
    @room = Room.find(params[:room_id])
  end
  def index
    @messages = @room.messages
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end
  def create
    @message = @conversation.messages.build(params_messages)
    redirect_to room_messages_path(@room) if @message.save
  end
end
