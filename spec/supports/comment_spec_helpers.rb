module CommentSpecHelpers
  def fill_in_comment
    # 最初の提案をクリック
    first('.title a').click
    # コメントを入力
    fill_in 'comment[text]', with: 'aaa'
    click_button("#{I18n.t('.dictionary.words.submit')}")
  end
  def be_orderd?(array)
    binding.pry
    array.each_with_index do |a, idx|
      unless a > array[idx + 1]
        return
      end
    end
    true
  end
  def sort_dcsc(array)
    array.sort do |a, b|
      b[:id] <=> a[:id]
    end
  end
  def create_comment_list
    10.times do
      create(:comment, suggest_id: suggest.id, user_id: user.id)
    end
  end
  def comment_list
    list = []
    10.times do
      list << create(:comment, suggest_id: suggest.id, user_id: user.id)
    end
    list
  end
  # def select_driver(example)
  #   if example.metadata[:js]
  #     Capybara.current_driver = :selenium
  #   else
  #     Capybara.use_default_driver
  #   end
  # end
end
