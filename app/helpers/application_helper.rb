module ApplicationHelper
  def corp_prop_registerd
    if current_user.corporation_id.nil? && current_user.proprietorship_id.nil?
      redirect_to select_corporations_path, warning: t('.register needed')
    end
  end
end
