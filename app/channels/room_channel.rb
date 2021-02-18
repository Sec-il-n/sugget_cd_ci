class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"#同ファイル名
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # 追記
    if data['message'][0].present?
      message = Message.new(text: data['message'][0], user_id: data['message'][1].to_i, room_id: data['message'][2].to_i)

      message.save
      # jobs/chat_message_broadcast_job.rbへ移動済み
      ActionCable.server.broadcast 'room_channel', message: data['message'][0]#[0]を除くとID x 2が表示される
    end
  end
end
