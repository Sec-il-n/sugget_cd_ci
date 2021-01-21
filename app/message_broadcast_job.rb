class MessageBroadcastJob < ApplicationJob
  # queue_as :default
  #
  # def perform(data)
  #   ActionCable.server.broadcast 'room_channel', message: data['message'][0]#[0]を除くとID x 2が表示される
  #   # 参考にしたコードはviewで直接renderしている
  #   # 他の参考コードは「message: render_message(message)」になっている
  #   # private
  #   # def render_message(message)
  #   #   ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  #   # end
  # end
end
