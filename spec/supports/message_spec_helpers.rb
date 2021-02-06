module MessageSpecHelpers
  def send_message
    visit participants_path
    click_on 'チャットルーム開設'
    fill_in 'chat_input', with: 'abce'
    find('#chat_input').native.send_key(:return)
  end
end
