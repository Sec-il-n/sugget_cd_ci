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
      confirm_suggests_path if action_name == 'create' || action_name == 'new'
  end
  def participants_find
    current_user.participants.find_by(suggest_id: @suggest.id)
  end
end
