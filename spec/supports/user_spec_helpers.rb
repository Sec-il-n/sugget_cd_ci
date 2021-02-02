module UserSpecHelpers
  def login_valid_user
    user.confirm

    visit new_user_session_path
        fill_in "#{I18n.t('.dictionary.words.email')}", with: user.email
        fill_in "#{I18n.t('.dictionary.words.password')}" , with: user.password
        click_button "#{I18n.t('.dictionary.words.sign_in')}"
  end
  def login_admin(admin)
    sign_in users(admin), scope: :admin
  end
end
