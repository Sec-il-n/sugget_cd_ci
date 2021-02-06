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
  def upload_image
    visit new_suggest_path
    file_path = Rails.root.join('spec', 'supports','866-200x300.jpg')
    attach_file('suggest[images_attributes][0][image]',file_path)
    # attach_file('suggest[images_attributes][0][image]','spec/supports/866-200x300.jpg')
    fill_in "#{I18n.t('.dictionary.words.title')}", with:
      '提案'
    fill_in "#{I18n.t('.dictionary.words.details')}", with:
      '詳細'
    check('タグ_1')
    check('タグ_3')
    click_button("#{I18n.t('.dictionary.words.submit')}")

  end
  def join_to_suggest
    visit suggests_path
    first('.title a').click
    click_on("#{I18n.t('.dictionary.words.join')}")
  end
  # def get_url
  #   URI.parse(current_url)
  # end
  # def assert_url_visible
  #   wait_until { page.find('.select_corp').visible? }
  # rescue => e
  #   puts e.class
  # end
end
