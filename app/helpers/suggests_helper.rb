module SuggestsHelper
  def choose_corp_or_prop_path(suggest)

    if suggest.user.corporation_id.present?
      corporation_path(suggest.user.corporation_id)

    elsif suggest.user.proprietorship_id.present?
      proprietorship_path(suggest.user.proprietorship_id)

    end
  end
    # present? => nil、空 = false
  def choose_corp_or_prop
    if @suggest.user.corporation_id.present?
      @suggest.user.corporation

    elsif @suggest.user.proprietorship_id.present?
      @suggest.user.proprietorship
    end
  end
  def choose_confirm_path
    if action_name == 'create' || action_name == 'new'
      confirm_suggests_path
    elsif action_name == 'edit'
      edit_suggest_path
    end
  end
  def participants_find
    current_user.participants.find_by(suggest_id: @suggest.id)
  end
  def corp_prop_registerd
    if current_user.corporation_id.nil? && current_user.proprietorship_id.nil?
      redirect_to select_corporations_path, warning: t('.register needed')
    end
  end
  def belonging_registration_path
    if current_user.corporation_id.nil? && current_user.proprietorship_id.nil?
      select_corporations_path
    end
  end
end
