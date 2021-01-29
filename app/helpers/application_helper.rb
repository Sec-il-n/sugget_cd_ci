module ApplicationHelper
  def belonging_registration_path
    if current_user.corporation_id.nil? && current_user.proprietorship_id.nil?
      select_corporations_path
    end
  end
end
