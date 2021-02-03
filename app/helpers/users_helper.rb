module UsersHelper
  def create_not_permitted
    if current_user.corporation_id.present? || current_user.proprietorship_id.present?
      redirect_to suggests_path, warning: '企業登録は完了しています'
    end
  end
end
