class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"#同ファイル名
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(text: data['message'][0], user_id: data['message'][1].to_i, room_id: data['message'][2].to_i)
    
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
