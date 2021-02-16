require 'active_support/concern'

module ContactConcern
  extend ActiveSupport::Concern

  def params_contact
    params.require(:contact).permit(:content).merge(user_id: current_user.id)
  end

end
