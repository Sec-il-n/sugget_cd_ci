module SuggestSpecHelpers
  def confirm_view
    visit new_suggest_path
    fill_in "#{I18n.t('.dictionary.words.title')}", with:
    '提案'
    fill_in "#{I18n.t('.dictionary.words.details')}", with:
    '詳細'
    check('タグ_1')
    check('タグ_3')
    click_button("#{I18n.t('.dictionary.words.submit')}")
  end
end
