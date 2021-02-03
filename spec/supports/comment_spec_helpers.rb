module CommentSpecHelpers
  def fill_in_comment
    # 最初の提案をクリック
    first('.title a').click
    # コメントを入力
    fill_in 'comment[text]', with: 'aaa'
    click_button("#{I18n.t('.dictionary.words.submit')}")
  end
end
