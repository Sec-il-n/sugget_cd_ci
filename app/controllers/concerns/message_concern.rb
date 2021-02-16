require 'active_support/concern'

module MessageConcern
  extend ActiveSupport::Concern

  def params_messages
    params.require(:message).permit(:text, :user_id)
  end

end
