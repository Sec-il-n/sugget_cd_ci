require 'active_support/concern'
module MessageModelConcern
  extend ActiveSupport::Concern

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
